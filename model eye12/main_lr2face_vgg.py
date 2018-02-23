# -*- cod   ing:CP949 -*-
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

from pympler import refbrowser
import gc
import os
import datetime
import threading
import time
import math
import numpy as np
import tensorflow as tf
from tensorflow.python.ops import math_ops
from tensorflow.python.ops import random_ops
from tensorflow.python.ops import array_ops
from tensorflow.python.framework import ops
from tensorflow.python.framework import graph_util
from tensorflow.python.framework import tensor_shape
from tensorflow.python.framework import tensor_util
from tensorflow.python.layers import utils
import matplotlib
#matplotlib.use('Agg')
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import random
import matplotlib.pyplot as plt
from vision import image
import freeze_graph
import optimize_for_inference
import multiprocessing
from multiprocessing import Process, Queue
from pympler.tracker import SummaryTracker

useSELU = False

def _variable_with_weight_decay(shape, wd=None):
    # Determine number of input features from shape
    f_in = np.prod(shape[:-1]) if len(shape) == 4 else shape[0]
    
    # Calculate sdev for initialization according to activation function
    if useSELU:
        sdev = math.sqrt(1 / f_in)
    else:
        sdev = math.sqrt(2 / f_in)
    
    var = tf.Variable(tf.truncated_normal(shape=shape, stddev=sdev))
    if wd is not None:
        weight_decay = tf.reduce_sum(tf.multiply(tf.nn.l2_loss(var), wd))
        tf.add_to_collection('losses', weight_decay)
    return var

def convWeight(shape):
    return _variable_with_weight_decay(shape=shape)
def fcWeight(shape, weight_decay = 0.001):
    return _variable_with_weight_decay(shape=shape, wd=weight_decay)
def biasWeight(shape):
    return tf.Variable(tf.constant(0.0, shape=shape, dtype=tf.float32))

def weight_variable_deactivated_lol(shape):
    l = len(shape)
    base = 2
    if(useSELU):
        base = 1
    dev = 0.1
    if(l==4):
        dev = math.sqrt(float(base)/float(shape[0]*shape[1]*shape[2]))
    elif(l==2):
        dev = math.sqrt(float(base)/float(shape[0]))
    print(dev)
    initial = tf.random_normal(shape, stddev=dev)
    return tf.Variable(initial)

def bias_variable_deactivated_lol(shape):
    initial = tf.random_normal(shape, stddev=0)
    return tf.Variable(initial)

def conv2d(x, W, stride = 1, pad='SAME'):
    return tf.nn.conv2d(x, W, strides=[1,stride, stride, 1], padding=pad)

def max_pool(x, size=2):
    return tf.nn.max_pool(x, ksize=[1, size, size, 1], strides=[1, size, size, 1], padding='SAME')

def avg_pool_2x2(x):
    return tf.nn.avg_pool(x, ksize=[1, 2, 2, 1], strides=[1, 2, 2, 1], padding='SAME')

#ref. http://stackoverflow.com/questions/33949786/how-could-i-use-batch-normalization-in-tensorflow
def batch_norm(x, n_out, phase_train, scope='bn'):
    with tf.variable_scope(scope):
        beta = tf.Variable(tf.constant(0.0, shape=[n_out]), trainable=True)
        gamma = tf.Variable(tf.constant(1.0, shape=[n_out]), trainable=True)
        batch_mean, batch_var = tf.nn.moments(x, [0,1,2])
        ema = tf.train.ExponentialMovingAverage(decay=0.5)

        def mean_var_with_update():
            ema_apply_op = ema.apply([batch_mean, batch_var])
            with tf.control_dependencies([ema_apply_op]):
                return tf.identity(batch_mean), tf.identity(batch_var)
        
        mean, var = tf.cond(phase_train, mean_var_with_update, lambda: (ema.average(batch_mean), ema.average(batch_var)))
        normed = tf.nn.batch_normalization(x, mean, var, beta, gamma, 1e-3)
    return normed

def relu(tensor):
    return tf.nn.relu(tensor)

def selu(x):
    alpha = 1.6732632423543772848170429916717
    scale = 1.0507009873554804934193349852946
    return scale * tf.where(x >= 0.0, x, alpha * tf.nn.elu(x))

def dropout_selu(x, rate, alpha= -1.7580993408473766, fixedPointMean=0.0, fixedPointVar=1.0, 
                 noise_shape=None, seed=None, name=None, training=False):
    """Dropout to a value with rescaling."""

    def dropout_selu_impl(x, rate, alpha, noise_shape, seed, name):
        keep_prob = 1.0 - rate
        x = ops.convert_to_tensor(x, name="x")
        # if isinstance(keep_prob, numbers.Real) and not 0 < keep_prob <= 1:
        #     raise ValueError("keep_prob must be a scalar tensor or a float in the "
        #                                      "range (0, 1], got %g" % keep_prob)
        keep_prob = ops.convert_to_tensor(keep_prob, dtype=x.dtype, name="keep_prob")
        keep_prob.get_shape().assert_is_compatible_with(tensor_shape.scalar())

        alpha = ops.convert_to_tensor(alpha, dtype=x.dtype, name="alpha")
        keep_prob.get_shape().assert_is_compatible_with(tensor_shape.scalar())

        if tensor_util.constant_value(keep_prob) == 1:
            return x

        noise_shape = noise_shape if noise_shape is not None else array_ops.shape(x)
        random_tensor = keep_prob
        random_tensor += random_ops.random_uniform(noise_shape, seed=seed, dtype=x.dtype)
        binary_tensor = math_ops.floor(random_tensor)
        ret = x * binary_tensor + alpha * (1-binary_tensor)

        a = tf.sqrt(fixedPointVar / (keep_prob *((1-keep_prob) * tf.pow(alpha-fixedPointMean,2) + fixedPointVar)))

        b = fixedPointMean - a * (keep_prob * fixedPointMean + (1 - keep_prob) * alpha)
        ret = a * ret + b
        ret.set_shape(x.get_shape())
        return ret

    with tf.name_scope(name, "dropout", [x]) as name:
        return utils.smart_cond(training,
            lambda: dropout_selu_impl(x, rate, alpha, noise_shape, seed, name),
            lambda: array_ops.identity(x))

def dropout(tensor, rate, training):
    if(useSELU):
        return dropout_selu(tensor, rate, training=training)
    return tf.nn.dropout(tensor, rate)

def activate(tensor):
    if(useSELU):
        return selu(tensor)
    return relu(tensor)

def shape(tensor):
    s = tensor.get_shape()
    return tuple([s[i].value for i in range(0, len(s))])

def res_block(tensor, ch, phase_train, useBnorm):
    # res blocks example
    # block = res_block(input, 64, phase_train, useBnorm)
    # block = res_block(block, 64, phase_train, useBnorm)
    # block = res_block(block, 64, phase_train, useBnorm)
    # block = avg_pool_2x2(block)
    # blockR = avg_pool_2x2(blockR)
    # print(block)
    # print(blockR)
    if not ch % 4 == 0:
        raise Exception()
    
    pool = tensor
    poolR = tensorR
    chneck = int(ch / 4)

    #first
    W_conv = convWeight([1, 1, ch, chneck])
    b_conv = biasWeight([chneck])

    h_conv = conv2d(pool, W_conv) + b_conv
    if(useBnorm):
        h_conv = batch_norm(h_conv, chneck, phase_train)
    h_conv = activate(h_conv)
    pool = h_conv

    #second
    W_conv = convWeight([3, 3, chneck, chneck])
    b_conv = biasWeight([chneck])

    h_conv = conv2d(pool, W_conv) + b_conv
    if(useBnorm):
        h_conv = batch_norm(h_conv, chneck, phase_train)
    h_conv = activate(h_conv)
    pool = h_conv

    #last
    W_conv = convWeight([1, 1, chneck, ch])
    b_conv = biasWeight([ch])

    h_conv = conv2d(pool, W_conv) + b_conv
    pool = h_conv

    #res
    pool = pool + tensor
    if(useBnorm):
        pool = batch_norm(pool, ch, phase_train)
    pool = activate(pool)

    return pool

def res_block_shared(tensor, tensorR, ch, phase_train, useBnorm):
    # res blocks example
    # block, blockR = res_block_shared(h_conv2, h_conv2R, 64, phase_train, useBnorm)
    # block, blockR = res_block_shared(block, blockR, 64, phase_train, useBnorm)
    # block, blockR = res_block_shared(block, blockR, 64, phase_train, useBnorm)
    # block = avg_pool_2x2(block)
    # blockR = avg_pool_2x2(blockR)
    # print(block)
    # print(blockR)
    if not ch % 4 == 0:
        raise Exception()
    
    pool = tensor
    poolR = tensorR
    chneck = int(ch / 4)

    #first
    W_conv = convWeight([1, 1, ch, chneck])
    b_conv = biasWeight([chneck])

    h_conv = conv2d(pool, W_conv) + b_conv
    if(useBnorm):
        h_conv = batch_norm(h_conv, chneck, phase_train)
    h_conv = activate(h_conv)
    pool = h_conv

    h_conv = conv2d(poolR, W_conv) + b_conv
    if(useBnorm):
        h_conv = batch_norm(h_conv, chneck, phase_train)
    h_conv = activate(h_conv)
    poolR = h_conv

    #second
    W_conv = convWeight([3, 3, chneck, chneck])
    b_conv = biasWeight([chneck])

    h_conv = conv2d(pool, W_conv) + b_conv
    if(useBnorm):
        h_conv = batch_norm(h_conv, chneck, phase_train)
    h_conv = activate(h_conv)
    pool = h_conv

    h_conv = conv2d(poolR, W_conv) + b_conv
    if(useBnorm):
        h_conv = batch_norm(h_conv, chneck, phase_train)
    h_conv = activate(h_conv)
    poolR = h_conv

    #last
    W_conv = convWeight([1, 1, chneck, ch])
    b_conv = biasWeight([ch])

    h_conv = conv2d(pool, W_conv) + b_conv
    pool = h_conv

    h_conv = conv2d(poolR, W_conv) + b_conv
    poolR = h_conv

    #res
    pool = pool + tensor
    if(useBnorm):
        pool = batch_norm(pool, ch, phase_train)
    pool = activate(pool)

    poolR = poolR + tensor
    if(useBnorm):
        poolR = batch_norm(poolR, ch, phase_train)
    poolR = activate(poolR)

    return pool, poolR

def conv2dSingle(pool, phase_train, useBnorm, weightShape, stride = 1, poolsize=2):
    filterW = weightShape[0]
    filterH = weightShape[1]
    preCh = shape(pool)[3]
    ch = weightShape[2]

    #conv
    W_conv = convWeight([filterW, filterH, preCh, ch])
    b_conv = biasWeight([ch])

    h_conv = conv2d(pool, W_conv, stride = stride) + b_conv
    if(useBnorm):
        h_conv = batch_norm(h_conv, ch, phase_train)
    h_conv = activate(h_conv)
    h_pool = h_conv
    h_pool = max_pool(h_conv, size=poolsize)
    print(h_pool)

    return h_pool

def conv2dShared(pool1, pool2, phase_train, useBnorm, weightShape, stride = 1, poolsize=2):
    filterW = weightShape[0]
    filterH = weightShape[1]
    preCh = shape(pool1)[3]
    ch = weightShape[2]

    #conv
    W_conv = convWeight([filterW, filterH, preCh, ch])
    b_conv = biasWeight([ch])

    h_conv = conv2d(pool1, W_conv, stride = stride) + b_conv
    if(useBnorm):
        h_conv = batch_norm(h_conv, ch, phase_train)
    h_conv = activate(h_conv)
    h_pool = h_conv
    h_pool = max_pool(h_conv, size=poolsize)
    print(h_pool)

    #conv_r
    W_convR = W_conv
    b_convR = b_conv

    h_convR = conv2d(pool2, W_convR, stride = stride) + b_convR
    if(useBnorm):
        h_convR = batch_norm(h_convR, ch, phase_train)
    h_convR = activate(h_convR)
    h_poolR = h_convR
    h_poolR = max_pool(h_convR, size=poolsize)
    print(h_poolR)

    return h_pool, h_poolR

#evaluate new model
def eval(bsize=20, tbsize=20, ep = 25, lr = 1e-4, debugstep=8, savepath=None, savemodel = False, useBnorm = True, droprate = 0.5, decay_ephoc=1, decay_rate=0.8, loadmodel=False):
    testdrop = 1.0
    if(useSELU):
        testdrop = 0.0
    #input vars
    x_l = tf.placeholder(tf.float32, shape=[None, data.imagesize, data.imagesize, 3], name='input_image')
    x_r = tf.placeholder(tf.float32, shape=[None, data.imagesize, data.imagesize, 3], name='input_image_r')
    x_f = tf.placeholder(tf.float32, shape=[None, data.facesize, data.facesize, 3], name='input_image_f')
    y_ = tf.placeholder(tf.float32, shape=[None, 2], name='input_label')
    keep_prob = tf.placeholder(tf.float32, name='keep_prob')
    phase_train = tf.placeholder(tf.bool, name='phase_train')

    print("x_l_image=", x_l)
    print("x_r_image=", x_r)
    print("x_f_image=", x_f)

    #eye
    h_pool, h_poolR = conv2dShared(x_l, x_r, phase_train, useBnorm, [3, 3, 16])
    h_pool, h_poolR = conv2dShared(h_pool, h_poolR, phase_train, useBnorm, [3, 3, 24])
    h_pool, h_poolR = conv2dShared(h_pool, h_poolR, phase_train, useBnorm, [3, 3, 32])
    h_pool, h_poolR = conv2dShared(h_pool, h_poolR, phase_train, useBnorm, [3, 3, 48], poolsize=1)
    h_pool, h_poolR = conv2dShared(h_pool, h_poolR, phase_train, useBnorm, [3, 3, 48], poolsize=1)
    h_pool, h_poolR = conv2dShared(h_pool, h_poolR, phase_train, useBnorm, [3, 3, 48])
    h_pool, h_poolR = conv2dShared(h_pool, h_poolR, phase_train, useBnorm, [3, 3, 64], poolsize=1)
    h_pool, h_poolR = conv2dShared(h_pool, h_poolR, phase_train, useBnorm, [3, 3, 64], poolsize=1)
    h_pool, h_poolR = conv2dShared(h_pool, h_poolR, phase_train, useBnorm, [3, 3, 64])
    #h_pool, h_poolR = conv2dShared(h_pool, h_poolR, phase_train, useBnorm, [3, 3, 193], poolsize=1)
    #h_pool, h_poolR = conv2dShared(h_pool, h_poolR, phase_train, useBnorm, [3, 3, 128], poolsize=1)
    shape_clast = shape(h_pool)
    print(shape_clast)

    size_clast = shape_clast[1] * shape_clast[2] * shape_clast[3]
    h_clast_flat = tf.reshape(h_pool, [-1, size_clast])
    h_clastR_flat = tf.reshape(h_poolR, [-1, size_clast])
    h_flat = tf.concat([h_clast_flat, h_clastR_flat],1)
    print(h_flat)

    W_fc1 = fcWeight([size_clast * 2, 128])
    b_fc1 = biasWeight([128])
    h_fc1 = activate(tf.matmul(h_flat, W_fc1) + b_fc1)
    h_fc1 = dropout(h_fc1, keep_prob, training = phase_train)
    print(h_fc1)

    #face
    f_pool = conv2dSingle(x_f, phase_train, useBnorm, [3, 3, 32], poolsize=1)
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 32])
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 64], poolsize=1)
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 64])
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 128], poolsize=1)
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 128], poolsize=1)
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 128])
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 256], poolsize=1)
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 256], poolsize=1)
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 256])
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 386], poolsize=1)
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 386], poolsize=1)
    f_pool = conv2dSingle(f_pool, phase_train, useBnorm, [3, 3, 386])
    size_fpool = shape(f_pool)
    print(size_fpool)

    size_fpool = size_fpool[1] * size_fpool[2] * size_fpool[3]
    f_flat = tf.reshape(f_pool, [-1, size_fpool])
    print(f_flat)

    Wf_fc1 = fcWeight([size_fpool, 100])
    bf_fc1 = biasWeight([100])
    f_fc1 = activate(tf.matmul(f_flat, Wf_fc1) + bf_fc1)
    f_fc1 = dropout(f_fc1, keep_prob, training = phase_train)
    print(f_fc1)

    Wf_fc2 = fcWeight([100, 100])
    bf_fc2 = biasWeight([100])
    f_fc2 = activate(tf.matmul(f_fc1, Wf_fc2) + bf_fc2)
    f_fc2 = dropout(f_fc2, keep_prob, training=phase_train)
    print(f_fc2)
    f_fc1 = f_fc2

    #final FC
    fi_pre = tf.concat([f_fc1, h_fc1], 1)
    fi_preSize = shape(fi_pre)[1]
    print(fi_preSize)

    Wfi_fc1 = fcWeight([fi_preSize, 128])
    bfi_fc1 = biasWeight([128])
    fi_fc1 = activate(tf.matmul(fi_pre, Wfi_fc1) + bfi_fc1)
    fi_fc1 = dropout(fi_fc1, keep_prob, training = phase_train)
    print(fi_fc1)

    #regression
    W_fclast = fcWeight([128, 2])
    b_fclast = biasWeight([2])
    
    y_nn = tf.add(tf.matmul(fi_fc1, W_fclast), 0, name="output")

    #accuracy
    worst_correct_prediction = tf.reduce_max(tf.sqrt(tf.reduce_sum(tf.square(y_nn - y_), 1)))
    best_correct_prediction = tf.reduce_min(tf.sqrt(tf.reduce_sum(tf.square(y_nn - y_), 1)))
    mean_correct_prediction = tf.reduce_mean(tf.sqrt(tf.reduce_sum(tf.square(y_nn - y_), 1)))
    correct_precent = 100 - mean_correct_prediction / data.anglemul * 100
    print(best_correct_prediction)

    #trainer
    dist = tf.sqrt(tf.reduce_sum(tf.square(y_nn - y_), 1))
    #mean sum sqr
    #0.08 test error (wo batch)
    loss = tf.reduce_mean(tf.reduce_sum(tf.square(y_nn - y_), 1) / 2)
    #mean sqr
    #loss = tf.reduce_mean(tf.square(y_nn - y_))
    #distance
    #loss = dist
    #l2 loss
    #wb125 0.12 wo weight decay 
    #loss = tf.nn.l2_loss(y_nn - y_)

    global_step = tf.Variable(0, trainable=False)
    if(useRateDecay):
        starter_learning_rate = lr
        decay_r = decay_ephoc * data.size / bsize
        print("decay step:", decay_r)
        learning_rate = tf.train.exponential_decay(starter_learning_rate, global_step, int(decay_r), decay_rate, staircase=True)
    else:
        learning_rate = lr
    
    if(useWeightDecay):
        tf.add_to_collection('losses', loss)
        loss = tf.add_n(tf.get_collection('losses'), name='total_loss')
    
    if(useBnorm):
        update_ops = tf.get_collection(tf.GraphKeys.UPDATE_OPS, scope='bn')
        with tf.control_dependencies(update_ops):
            train_step = tf.train.AdamOptimizer(learning_rate).minimize(loss, global_step=global_step)
    else:
        train_step = tf.train.AdamOptimizer(learning_rate).minimize(loss, global_step=global_step)
    
    print(loss)

    #ready temp vars
    ephoc = ep
    last_step = 0
    last_time = time.time()
    step = 0
    lastephoc = -1
    lastgc = -1
    testacc = 0
    acc_max = 0
    acc_ephoc = []
    acc_means = []
    acc_test = []
    acc_lr = []
    acc_steps = []
    acc_loss = []
    acc_sum = 0.0
    acc_count = 0.0
    step_per_sec = 0
    checkpoint_state_name = "checkpoint_state"
    checkpoint_prefix = os.path.join(savedir, "saved_checkpoint")
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True

    #init saver
    if(savemodel or loadmodel):
        saver = tf.train.Saver()
    
    #session init
    with tf.Session(config=config) as sess:
        sess.run(tf.global_variables_initializer())
        if(savepath != None and savemodel):
            tf.train.write_graph(sess.graph_def, '', os.path.join(savepath, "graph.pb"))
        if(loadmodel):
            print("restoring model")
            saver.restore(sess, checkpoint_prefix+'-0')
        #train loop
        step_total = int(data.size * ephoc / bsize)
        for i in range(0, step_total):
            batch_img_l, batch_img_r, batch_img_f, batch_label = data.batch(bsize)
            step += bsize
            if (i !=0 and i % debugstep == 0) or i == (step_total - 1):
                #run train acc
                feeding = { x_l:batch_img_l, x_r:batch_img_r, x_f:batch_img_f, y_:batch_label, phase_train:False, keep_prob: testdrop }
                req_fetch = [loss, correct_precent, mean_correct_prediction, worst_correct_prediction, best_correct_prediction, y_nn[0], y_[0]]
                if(useRateDecay):
                    req_fetch.append(learning_rate)
                fetches = sess.run(req_fetch, feed_dict=feeding)
                #acc update
                tacc = fetches[2]
                if(acc_max < tacc):
                    acc_max = tacc
                acc_means.append(tacc)
                acc_steps.append(step)
                acc_sum += tacc
                acc_count+=1
                acc_loss.append(fetches[0])
                acc_lr.append(fetches[len(fetches)-1]*1000)
                #run test acc
                tbatch_img_l, tbatch_img_r, tbatch_img_f, tbatch_label = datatest.batch(tbsize, randomize = False)
                tfeeding = { x_l:tbatch_img_l, x_r:tbatch_img_r, x_f:tbatch_img_f, y_:tbatch_label, phase_train:False, keep_prob: testdrop }
                tfetches = sess.run([mean_correct_prediction, correct_precent], feed_dict=tfeeding)
                testacc = tfetches[0]
                acc_test.append(testacc)
                #ephoc update
                e = math.floor(step/data.size)
                if(e!=lastephoc) or (step_total - 1) == i:
                    millis = int(round(time.time() * 1000))
                    if(millis - lastgc > 300000):
                        print("Garbage Colleting...")
                        gc.collect()
                        lastgc = millis
                    lastephoc = e
                    acc_ephoc.append(acc_sum / acc_count)
                    acc_sum = 0
                    acc_count = 0
                    #save model
                    print("Graph Saving...")
                    if(savepath != None and savemodel):
                        savedpath = saver.save(sess, checkpoint_prefix, global_step=0, latest_filename=checkpoint_state_name)
                        print("Graph saved in:", savedpath)
                    #save plot
                    print("Plot Saving...")
                    fig = plt.Figure()
                    canvas = FigureCanvasTkAgg(fig)
                    ax = fig.add_subplot(111)
                    ax.plot(acc_steps, acc_means, label="Train")
                    ax.plot(acc_steps, acc_test, label="Test")
                    ax.plot(acc_steps, acc_loss, label="Loss")
                    ax.plot(acc_steps, acc_lr, label="L.Rate*1000")
                    ax.set_ylim([0, 0.45])
                    ax.set_xlabel("step")
                    ax.set_ylabel("mean error")
                    ax.legend(loc='upper right')
                    ax.grid(True)
                    pltname = modeltitle + " ephocs " + str(e) + "-" + str(ep) + " anglemul " + str(data.anglemul) + " lr " + str(lr) + ".png"
                    pltname = "MEAN ACC " + str((testacc+acc_ephoc[-1])*0.5) +  " TEST ACC " + str(testacc) + " TRAIN ACC " + str(acc_ephoc[-1]) + " " + pltname
                    pltfile = os.path.join(savedir, pltname)
                    canvas.print_figure(pltfile)
                    fig.clf()
                    fig.clear()
                    plt.clf()
                    plt.cla()
                    plt.close()
                    print("Saved Plot : " + pltname)
                    del fig, canvas, pltfile, pltname, ax
                #print debug msg
                time_now = time.time()
                step_per_sec = (step - last_step) / (time_now - last_time)
                print("Epoch: "+str(e)+"  Step: "+str(step)+"  Fetches:"+str(fetches)+"  TFectches:"+str(tfetches) + " Steps/Second:"+str(step_per_sec))
                last_step = step
                last_time = time_now
                #free mem
                for item in fetches:
                    item = None
                fetches.clear()
                for item in tfetches:
                    item = None
                tfetches.clear()
                for item in feeding:
                    item = None
                feeding.clear()
                for item in tfeeding:
                    item = None
                tfeeding.clear()
                del tbatch_img_l, tbatch_img_r, tbatch_img_f, tbatch_label, tfetches, fetches, feeding, tfeeding
            #train nn
            feeding = {x_l: batch_img_l, x_r: batch_img_r, x_f: batch_img_f, y_: batch_label, phase_train:True, keep_prob: droprate }
            t = sess.run([train_step], feed_dict=feeding)
            for item in t:
                item = None
            t.clear()
            for item in feeding:
                item = None
            feeding.clear()
            del batch_img_l, batch_img_r, batch_img_f, batch_label, t, feeding
        #report acc per ephoc
        print("Ephoc Accuracies: ")
        for ei in range(0, len(acc_ephoc)):
            print("Ephoc " + str(ei) + " : " + str(acc_ephoc[ei]))
        #save model
        if(savepath != None and savemodel):
            saver.save(sess, checkpoint_prefix, global_step=0, latest_filename=checkpoint_state_name)
    tf.reset_default_graph()
    gc.collect()
    #return acc
    return acc_ephoc[-1] , testacc

class EvalScore:
    def __init__(self, lr, anglemul, accuracy):
        self.lr = lr
        self.anglemul = anglemul
        self.accuracy = accuracy
    def print(self):
        return "acc: " + str(self.accuracy) + "  lr: " + str(self.lr) + "  anglemul: " + str(self.anglemul)

def HyperparamatersOpt(datasize = 500):
    saved = []
    data.size = datasize
    for testind in range(0, 200):
        data.anglemul = 360
        #data.anglemul = random.randrange(1 , 1500)
        lr = 10 ** (float(random.randrange(24000,55000)) / 10000.0 * -1)
        datatest.anglemul = data.anglemul
        print("Randomized LR and Angle: " + str([lr, data.anglemul]))
        evalacc = eval(bsize=20, ep = 15, lr = lr, debugstep=3)
        saved.append(EvalScore(lr, data.anglemul, evalacc[1]))
        print("Eval " + str(testind) + " result: " + str(evalacc))
        report = ""
        accmax = -10000000
        accmaxind = -1
        for i in range(0, len(saved)):
            s = saved[i]
            report += s.print() +"\n"
            if s.accuracy > accmax:
                accmax = s.accuracy
                accmaxind = i
        print("=======PROGRASS=======")
        print(report)
        if(accmaxind > -1):
            print("Max Accuracy: " + saved[accmaxind].print())
        print("========REPORT========")

def Train(save = False, loadmodel=False, ep=60, useBnorm=True, bsize=20, tbsize=20, debugStep=100, decayEphoc=4):
    data.anglemul = 1
    datatest.anglemul = data.anglemul
    datatest.imagesize = data.imagesize
    lr = 0.0001
    drop = 0.75
    if(useSELU):
        drop = 0.001
    evalacc = eval(bsize=bsize, loadmodel=loadmodel, ep = ep, lr = lr, debugstep=debugStep, savepath=savedir, savemodel = save, useBnorm=useBnorm, droprate=drop, tbsize=tbsize, decay_ephoc=decayEphoc)
    print("result: " + str(evalacc))

def FreezeGraph(usecpu = False):
    # create a session
    sess = tf.Session()
    # import best model
    saver = tf.train.import_meta_graph(os.path.join(savedir, 'saved_checkpoint-0.meta')) # graph
    saver.restore(sess, os.path.join(savedir, 'saved_checkpoint-0')) # variables
    # get graph definition
    gd = sess.graph.as_graph_def()
    # fix batch norm nodes
    for node in gd.node:
        if node.op == 'RefSwitch':
            node.op = 'Switch'
            for index in range(len(node.input)):
                if 'moving_' in node.input[index]:
                    node.input[index] = node.input[index] + '/read'
        elif node.op == 'AssignSub':
            node.op = 'Sub'
            if 'use_locking' in node.attr: del node.attr['use_locking']
    # generate protobuf
    converted_graph_def = graph_util.convert_variables_to_constants(sess, gd, ["output"])
    tf.train.write_graph(converted_graph_def, savedir, 'frozen.pb', as_text=False)

#ref. https://blog.metaflow.fr/tensorflow-how-to-freeze-a-model-and-serve-it-with-a-python-api-d4f3596b3adc
def load_graph(frozen_graph_filename):
    with tf.gfile.GFile(frozen_graph_filename, "rb") as f:
        graph_def = tf.GraphDef()
        graph_def.ParseFromString(f.read())
    
    with tf.Graph().as_default() as graph:
        tf.import_graph_def(
            graph_def, 
            input_map=None, 
            return_elements=None, 
            name="name", 
            op_dict=None, 
            producer_op_list=None
        )
    return graph

def ModelTest(filename="frozen.pb", count=100, useBnorm=True, debugOp=False, testdata=None):
    testdrop = 1.0
    if(useSELU):
        testdrop = 0.0
    datatest.anglemul = 1
    filepath = os.path.join(savedir, filename)
    graph = load_graph(filepath)

    if(debugOp):
        for op in graph.get_operations():
            print(op.name)
    
    x_l = graph.get_tensor_by_name('name/input_image:0')
    x_r = graph.get_tensor_by_name('name/input_image_r:0')
    x_f = graph.get_tensor_by_name('name/input_image_f:0')
    keep_prob = graph.get_tensor_by_name('name/keep_prob:0')
    y = graph.get_tensor_by_name('name/output:0')
    if(useBnorm or useSELU):
        phase_train = graph.get_tensor_by_name('name/phase_train:0')

    errors = []
    pltLabel = []
    pltResult = []

    # We launch a Session
    with tf.Session(graph=graph) as sess:
        start = time.time()
        for i in range(count):
            img_l, img_r, img_f, lb = testdata.batch(1, randomize=False)
            if(useBnorm or useSELU):
                feed = { x_l: img_l, x_r: img_r, x_f: img_f, keep_prob:testdrop, phase_train:False }
            else:
                feed = { x_l: img_l, x_r: img_r, x_f: img_f, keep_prob:testdrop }
            fetch = sess.run(y, feed_dict=feed)
            error = np.average(np.sqrt(np.sum(np.square(lb - fetch), axis=1)))
            pltLabel.append(lb[0])
            pltResult.append(fetch[0])
            if not(math.isnan(error) or error > 10000000):
                errors.append(error)
            print(lb, fetch, error)
            del img_l, img_r, img_f, lb
        end = time.time()
    print("running time(sec)", end-start, "run/s", count/(end-start))
    print("mean", np.mean(errors))
    print("max", np.max(errors))
    print("min", np.min(errors))
    print("std", np.std(errors))
    print("writing plot")
    plt.ylim(-1,1)
    plt.xlim(-1,1)
    errFac = 1/max(errors)
    for i in range(0, len(pltLabel)):
        diff = pltResult[i] - pltLabel[i]
        plt.arrow(pltLabel[i][0], pltLabel[i][1], diff[0], diff[1], head_width=0.013, width=0.003, color=matplotlib.colors.to_rgba((1,0,0,1-max(errors[i]*errFac,0))))
    plt.show()
    print("end")

def __getstate__():
    self_dict = self.__dict__.copy()
    del self_dict['p']
    return self_dict

def __setstate__(state):
    __dict__.update(state)

if __name__ == "__main__":
    #model options
    logdir = "C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\log\\"
    savedir = "C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\model eye12\\"
    modeltitle = "face2"
    #use selu options
    useSELU = True
    #batch norm
    useBnorm = False
    #weight decaying
    useWeightDecay = True
    #learning rate decaying
    useRateDecay = True
    #load data before training. less cpu use, more training time
    dataPreLoad = True

    #running
    if(dataPreLoad):
        from vision import eyemodel_lr2face_preread as eyemodel_lr2face
    else:
        from vision import eyemodel_lr2face as eyemodel_lr2face

    p = multiprocessing.Pool(processes=16)
    
    basedir = "C:\\Library\\정올 2017\\Source\\GazeDataset\\"
    data = eyemodel_lr2face.decodeData([basedir + "eyesub1\\", basedir + "eyesub2\\", basedir + "eyesub3\\", basedir + "eyesub4\\", basedir + "eyesub5\\", basedir + "eyesub6\\", basedir + "eyesub7\\"], p)
    data.imagesize = 120
    data.facesize = 120
    data.debug = False
    #data.size = 50000

    datatest = eyemodel_lr2face.decodeData([basedir + "valid1\\"], p)
    datatest.imagesize = data.imagesize
    datatest.facesize = data.facesize
    datatest.debug = False

    #operations
    Train(True, loadmodel=False, ep=250, useBnorm=useBnorm, bsize=100, tbsize=25, debugStep=2, decayEphoc=15)
    FreezeGraph()
    ModelTest("frozen.pb", count=200, useBnorm=useBnorm, testdata=datatest)