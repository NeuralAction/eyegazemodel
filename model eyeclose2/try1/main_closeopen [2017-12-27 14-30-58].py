# -*- cod   ing:CP949 -*-
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

from pympler import refbrowser
import queue
import shutil
import gc
import os
import datetime
import threading
import time
import math
import numpy as np
import tensorflow as tf
from tensorflow.python import pywrap_tensorflow
from tensorflow.core.protobuf import config_pb2
from tensorflow.python.ops import math_ops
from tensorflow.python.ops import random_ops
from tensorflow.python.ops import array_ops
from tensorflow.python.framework import ops
from tensorflow.python.framework import graph_util
from tensorflow.python.framework import tensor_shape
from tensorflow.python.framework import tensor_util
from tensorflow.core.framework import attr_value_pb2
from tensorflow.core.framework import graph_pb2
from tensorflow.core.framework import node_def_pb2
from tensorflow.python.framework import dtypes
from tensorflow.python.platform import flags as flags_lib
from tensorflow.python.platform import tf_logging
from tensorflow.python.tools import strip_unused_lib
from tensorflow.python.tools import optimize_for_inference_lib as optlib
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
useGradientClip = False

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

managedWeight = []
def convWeight(shape):
    w = _variable_with_weight_decay(shape=shape)
    managedWeight.append(w)
    print("ConvWeihgt:", shape[0]*shape[1]*shape[2]*shape[3])
    return w

def fcWeight(shape, weight_decay = 0.001):
    w = _variable_with_weight_decay(shape=shape, wd=weight_decay)
    managedWeight.append(w)
    return w

def biasWeight(shape):
    w = tf.Variable(tf.constant(0.0, shape=shape, dtype=tf.float32))
    managedWeight.append(w)
    return w

def weightReport():
    c = 0
    fcC = 0
    biasC = 0
    convC = 0
    for i in range(0, len(managedWeight)):
        shp = shape(managedWeight[i])
        shpTotal = 1
        for s in range(0, len(shp)):
            shpTotal *= shp[s]
        c += shpTotal
        if(len(shp)==1):
            biasC+=shpTotal
        elif(len(shp)==2):
            fcC+=shpTotal
        elif(len(shp)==4):
            convC+=shpTotal
    print("Total Weight:", c)
    print("Fc Weight:", fcC)
    print("Bias Weight:", biasC)
    print("Conv Weight:", convC)

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

def max_pool_shared(x, xx, size=2):
    return max_pool(x, size), max_pool(xx, size)

def avg_pool_2x2(x, size=2):
    return tf.nn.avg_pool(x, ksize=[1, size, size, 1], strides=[1, size, size, 1], padding='SAME')

def avg_pool_2x2_shared(x, xx, size=2):
    return avg_pool_2x2(x, size=size), avg_pool_2x2(xx, size=size)

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

def dropout(tensor, rate, training, name=None):
    if(useSELU):
        return dropout_selu(tensor, rate, training=training, name=name)
    return tf.nn.dropout(tensor, rate, name=name)

def activate(tensor):
    if(useSELU):
        return selu(tensor)
    return relu(tensor)

def shape(tensor):
    s = tensor.get_shape()
    return tuple([s[i].value for i in range(0, len(s))])

def resBlockPool(tensor, poolsize=2):
    return avg_pool_2x2(tensor, size=poolsize)

def conv2dSingle(pool, phase_train, useBnorm, weightShape, stride = 1, poolsize=2):
    filterW = weightShape[0]
    filterH = weightShape[1]
    preCh = shape(pool)[3]
    ch = weightShape[2]

    #conv
    W_conv = convWeight([filterW, filterH, preCh, ch])
    b_conv = biasWeight([ch])

    h_conv = conv2d(pool, W_conv, stride = stride) + b_conv
    print(h_conv)
    if(useBnorm):
        h_conv = batch_norm(h_conv, ch, phase_train)
    h_conv = activate(h_conv)
    h_pool = h_conv
    if poolsize > 1:
        h_pool = max_pool(h_conv, size=poolsize)

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
    print(h_conv)
    if(useBnorm):
        h_conv = batch_norm(h_conv, ch, phase_train)
    h_conv = activate(h_conv)
    h_pool = h_conv
    if(poolsize > 1):
        h_pool = max_pool(h_conv, size=poolsize)

    #conv_r
    W_convR = W_conv
    b_convR = b_conv

    h_convR = conv2d(pool2, W_convR, stride = stride) + b_convR
    print(h_convR)
    if(useBnorm):
        h_convR = batch_norm(h_convR, ch, phase_train)
    h_convR = activate(h_convR)
    h_poolR = h_convR
    if(poolsize > 1):
        h_poolR = max_pool(h_convR, size=poolsize)

    return h_pool, h_poolR

def depthConv2d(pool, weight, stride = 1):
    return tf.nn.depthwise_conv2d(pool, weight, [1, stride, stride, 1], padding='SAME')

def depthConv2dSingle(pool, phase_train, useBnorm, kernelShape, chMul = 1, stride = 2):
    filterW = kernelShape[0]
    filterH = kernelShape[1]
    preCh = shape(pool)[3]
    ch = preCh * chMul

    Wconv = convWeight([filterW, filterH, preCh, chMul])
    Bconv = biasWeight([ch])

    pool = depthConv2d(pool, Wconv, stride) + Bconv
    if(useBnorm):
        pool = batch_norm(pool, ch, phase_train)
    pool = activate(pool)
    print(pool)

    return pool

def depthConv2dShared(pool1, pool2, phase_train, useBnorm, kernelShape, chMul = 1, stride = 2):
    filterW = kernelShape[0]
    filterH = kernelShape[1]
    preCh = shape(pool1)[3]
    ch = preCh * chMul

    Wshape = [filterW, filterH, preCh, chMul]
    Bshape = [ch]

    Wconv1 = convWeight(Wshape)
    Bconv1 = biasWeight(Bshape)
    Wconv2 = Wconv1
    Bconv2 = Bconv1

    pool1 = depthConv2d(pool1, Wconv1, stride) + Bconv1
    pool2 = depthConv2d(pool2, Wconv2, stride) + Bconv2
    if useBnorm:
        pool1 = batch_norm(pool1, ch, phase_train)
        pool2 = batch_norm(pool2, ch, phase_train)
    pool1 = activate(pool1)
    pool2 = activate(pool2)
    print(pool1, pool2)

    return pool1, pool2

def mobileLayer(pool, phase_train, useBnorm, weightShape, chMul = 1, poolsize = 2):
    pool = depthConv2dSingle(pool, phase_train, useBnorm, [weightShape[0], weightShape[1]], chMul, poolsize)
    pool = conv2dSingle(pool, phase_train, useBnorm, [1, 1, weightShape[2]], 1, 1)
    return pool

def mobileLayerShared(pool1, pool2, phase_train, useBnorm, weightShape, chMul = 1, poolsize = 2):
    pool1, pool2 = depthConv2dShared(pool1, pool2, phase_train, useBnorm, [weightShape[0], weightShape[1]], chMul, poolsize)
    pool1, pool2 = conv2dShared(pool1, pool2, phase_train, useBnorm, [1, 1, weightShape[2]], 1, 1)
    return pool1, pool2

def resBlock(tensor, ch, phase_train, useBnorm, poolsize = 1):
    # res blocks example
    # block = resBlock(input, 64, phase_train, useBnorm)
    # block = resBlock(block, 64, phase_train, useBnorm)
    # block = resBlock(block, 64, phase_train, useBnorm)
    # block = resBlockPool(block)
    # blockR = resBlockPool(blockR)
    if not ch % 4 == 0:
        print("input channel assert fail: ch % 4 != true")
        raise Exception()

    print("Building ResBlockShared")
    prePool = tensor
    pool = tensor
    if(poolsize>1):
        pool = resBlockPool(pool, poolsize=poolsize)
        prePool = pool
    preCh = shape(pool)[3]
    if not (ch == preCh):
        print("not preCh == ch", "preCh:", preCh, "ch:", ch)
    chneck = int(ch / 4)

    #first
    W_conv = convWeight([1, 1, preCh, chneck])
    b_conv = biasWeight([chneck])

    h_conv = conv2d(pool, W_conv) + b_conv
    if(useBnorm):
        h_conv = batch_norm(h_conv, chneck, phase_train)
    h_conv = activate(h_conv)
    pool = h_conv
    print(pool)

    #second
    W_conv = convWeight([3, 3, chneck, chneck])
    b_conv = biasWeight([chneck])

    h_conv = conv2d(pool, W_conv) + b_conv
    if(useBnorm):
        h_conv = batch_norm(h_conv, chneck, phase_train)
    h_conv = activate(h_conv)
    pool = h_conv
    print(pool)

    #last
    W_conv = convWeight([1, 1, chneck, ch])
    b_conv = biasWeight([ch])

    h_conv = conv2d(pool, W_conv) + b_conv
    pool = h_conv
    print(pool)

    #res
    if(ch == preCh):
        pool = pool + prePool
    if(useBnorm):
        pool = batch_norm(pool, ch, phase_train)
    pool = activate(pool)
    print(pool)

    return pool

def resBlockShared(tensor, tensorR, ch, phase_train, useBnorm, poolsize=1):
    # res blocks example
    # block, blockR = resBlockShared(h_conv2, h_conv2R, 64, phase_train, useBnorm)
    # block, blockR = resBlockShared(block, blockR, 64, phase_train, useBnorm)
    # block, blockR = resBlockShared(block, blockR, 64, phase_train, useBnorm)
    # block = resBlockPool(block)
    # blockR = resBlockPool(blockR)
    if not ch % 4 == 0:
        print("input channel assert fail: ch % 4 != true")
        raise Exception()
    
    print("Building ResBlockShared")
    prePool = tensor
    prePoolR = tensorR
    pool = tensor
    poolR = tensorR
    preCh = shape(pool)[3]
    if(poolsize > 1):
        pool = resBlockPool(pool, poolsize=poolsize)
        poolR = resBlockPool(poolR, poolsize=poolsize)
        prePool = pool
        prePoolR = poolR
    if not (ch == preCh):
        print("not preCh == ch", "preCh:", preCh, "ch:", ch)        
    chneck = int(ch / 4)

    #first
    W_conv = convWeight([1, 1, preCh, chneck])
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
    print(pool, poolR)

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
    print(pool, poolR)

    #last
    W_conv = convWeight([1, 1, chneck, ch])
    b_conv = biasWeight([ch])

    h_conv = conv2d(pool, W_conv) + b_conv
    pool = h_conv

    h_conv = conv2d(poolR, W_conv) + b_conv
    poolR = h_conv
    print(pool, poolR)

    #res
    if(preCh == ch):
        pool = pool + prePool
    if(useBnorm):
        pool = batch_norm(pool, ch, phase_train)
    pool = activate(pool)
    
    if(preCh == ch):
        poolR = poolR + prePoolR
    if(useBnorm):
        poolR = batch_norm(poolR, ch, phase_train)
    poolR = activate(poolR)
    print(pool, poolR)

    return pool, poolR

def flat(tensor):
    tShape = shape(tensor)
    return tf.reshape(tensor, [-1, tShape[1] * tShape[2] * tShape[3]])

def fc(tensor, nodeNum, keep_prob, phase_train, name=None):
    fcsize = shape(tensor)[1]
    W_fc = fcWeight([fcsize, nodeNum])
    b_fc = biasWeight([nodeNum])
    return dropout(activate(tf.add(tf.matmul(tensor, W_fc), b_fc)), keep_prob, phase_train, name=name)

def regression(tensor, nodeNum, name=None):
    tensor_size = shape(tensor)[1]
    W_fc = fcWeight([tensor_size, nodeNum])
    b_fc = biasWeight([nodeNum])
    return tf.add(tf.matmul(tensor, W_fc), b_fc, name=name)

def inference(pool, numClass, name=None):
    fcsize = shape(pool)[1]
    weight = fcWeight([fcsize, numClass])
    bias = biasWeight([numClass])
    
    pool = tf.add(tf.matmul(pool, weight), bias)
    pool = tf.nn.softmax(pool, name="output")
    return pool

def batchimg(data, batch_size, que):
    a = data.batch(batch_size)
    que.put(a)

def eval(bsize=20, tbsize=20, ep = 25, lr = 1e-4, debugstep=8, savepath=None, savemodel = False, useBnorm = True, droprate = 0.5, decay_ephoc=1, decay_rate=0.8, loadmodel=False):
    testdrop = 1.0
    if(useSELU):
        testdrop = 0.0
    
    x = tf.placeholder(tf.float32, shape=[None, data.imagesize, data.imagesize, 3], name='input_image')
    y_ = tf.placeholder(tf.float32, shape=[None, 2], name='input_label')
    keep_prob = tf.placeholder(tf.float32, name='keep_prob')
    phase_train = tf.placeholder(tf.bool, name='phase_train')

    print("x_image", x)

    #conv
    h_pool = conv2dSingle(x, phase_train, useBnorm, [3, 3, 20])
    h_pool = mobileLayer(h_pool, phase_train, useBnorm, [3, 3, 20])
    h_pool = mobileLayer(h_pool, phase_train, useBnorm, [3, 3, 20])
    #h_pool = avg_pool_2x2(h_pool, shape(h_pool)[1])
    print(h_pool)
    h_pool = flat(h_pool)
    print(h_pool)
    h_pool = fc(h_pool, 128, keep_prob, phase_train)
    print(h_pool)
    h_pool = inference(h_pool, 2, name="output")
    print(h_pool)
    y_nn = h_pool

    #compute graph cross-entropy
    loss = tf.reduce_mean(-tf.reduce_sum(y_ * tf.log(y_nn), reduction_indices = 1))
    #cross_entropy = -tf.reduce_sum(y_*tf.log(y_nn))
    print(loss)

    #accuracy
    correct_prediction = tf.equal(tf.argmax(y_nn, 1), tf.argmax(y_, 1))
    mean_accuracy = tf.reduce_mean(tf.cast(correct_prediction, "float"))

    #trainer
    global_step = tf.Variable(0, trainable=False)
    if(useRateDecay):
        starter_learning_rate = lr
        decay_r = decay_ephoc * data.size / bsize
        print("decay step:", decay_r)
        learning_rate = tf.train.exponential_decay(starter_learning_rate, global_step, int(decay_r), decay_rate, staircase=True)
    else:
        learning_rate = lr
    
    if(useWeightDecay):
        print("Use Weight Decay")
        tf.add_to_collection('losses', loss)
        loss = tf.add_n(tf.get_collection('losses'), name='total_loss')
    
    if(useBnorm):
        print("Use Bnorm")
        update_ops = tf.get_collection(tf.GraphKeys.UPDATE_OPS, scope='bn')
        with tf.control_dependencies(update_ops):
            train_step = tf.train.AdamOptimizer(learning_rate)
    else:
        train_step = tf.train.AdamOptimizer(learning_rate)
    
    gvs = train_step.compute_gradients(loss)
    if(useGradientClip):
        print("Use Gradient Clip")
        gvs = [(tf.clip_by_value(grad, -1., 1.), var) for grad, var in gvs]
    train_step = train_step.apply_gradients(gvs, global_step=global_step)
    
    print(loss)
    
    weightReport()

    #ready temp vars
    batch_size = bsize
    batch_thread = None
    batch_thread_run = False
    batch_img = None
    batch_label = None
    batch_queue = queue.Queue()
    ephoc = ep
    step = 0
    lastephoc = -1
    lastgc = -1
    testacc = 0
    acc_max = 0
    acc_ephoc = []
    acc_means = []
    acc_loss = []
    acc_test = []
    acc_steps = []
    acc_sum = 0.0
    acc_count = 0.0
    checkpoint_state_name = "checkpoint_state"
    checkpoint_prefix = os.path.join(savedir, "saved_checkpoint")

    #init saver
    if(savemodel or loadSave):
        saver = tf.train.Saver()
    
    #session init
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True
    with tf.Session(config=config) as sess:
        sess.run(tf.global_variables_initializer())
        if(savepath != None and savemodel):
            tf.train.write_graph(sess.graph_def, '', os.path.join(savepath, "graph.pb"))
            fileMe = os.path.abspath(__file__)
            fileDist = os.path.join(savepath, os.path.splitext(os.path.basename(fileMe))[0] + " ["+datetime.datetime.fromtimestamp(time.time()).strftime('%Y-%m-%d %H-%M-%S')+"].py")
            print("copy me to", fileDist)
            shutil.copy2(fileMe, fileDist)
        #train loop
        for i in range(0, int(data.size * ephoc / batch_size)):
            batch_img, batch_label = data.batch(batch_size)
            step += batch_size
            if i !=0 and i % debugstep == 0:
                #run train acc
                fetches = sess.run([loss, mean_accuracy, y_nn[0], y_[0]], feed_dict={ x:batch_img, y_:batch_label, phase_train:False, keep_prob: 1.0 })
                #acc update
                tacc = fetches[1]
                if(acc_max < tacc):
                    acc_max = tacc
                acc_means.append(tacc)
                acc_loss.append(fetches[0])
                acc_steps.append(step)
                acc_sum += tacc
                acc_count+=1
                #run test acc
                tbatch_img, tbatch_label = datatest.batch(tbsize, normalize = True, randomize = False)
                tfetches = sess.run([loss, mean_accuracy], feed_dict={ x:tbatch_img, y_:tbatch_label, phase_train:False, keep_prob: 1.0 })
                testacc = tfetches[1]
                acc_test.append(testacc)
                #ephoc update
                e = math.floor(step/data.size)
                if(e!=lastephoc):
                    millis = int(round(time.time() * 1000))
                    if(millis - lastgc > 1200000):
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
                        saver.save(sess, checkpoint_prefix, global_step=0, latest_filename=checkpoint_state_name)
                    #save plot
                    print("Plot Saving...")
                    plt.plot(acc_steps, acc_means, label="Train")
                    plt.plot(acc_steps, acc_test, label="Test")
                    plt.plot(acc_steps, acc_loss, label="Loss")
                    plt.ylim([0,1])
                    plt.xlabel("step")
                    plt.ylabel("accuracy")
                    plt.legend(loc='lower right')
                    plt.grid(True)
                    pltname = modeltitle + " ephocs " + str(e) + "-" + str(ep) + " anglemul " + str(data.anglemul) + " lr " + str(lr) + ".png"
                    pltname = "MEAN ACC " + str((testacc+acc_ephoc[-1])*0.5) +  " TEST ACC " + str(testacc) + " TRAIN ACC " + str(acc_ephoc[-1]) + " " + pltname
                    plt.savefig(os.path.join(savedir,pltname))
                    plt.clf()
                    plt.cla()
                    plt.close()
                    print("Saved Plot : " + pltname)
                #print debug msg
                print("Epoch: "+str(e)+"  Step: "+str(step)+"  Fetches:"+str(fetches)+"  TFectches:"+str(tfetches))
                #free mem
                del tbatch_img, tbatch_label, tfetches, fetches
            #train nn
            t = sess.run([train_step], feed_dict={x: batch_img, y_: batch_label, phase_train:True, keep_prob: 0.6 })
            del batch_img, batch_label, t
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

def Train(save = False, loadmodel=False, ep=60, useBnorm=True, bsize=20, tbsize=20, debugStep=100, decayEphoc=4):
    data.anglemul = 1
    datatest.anglemul = data.anglemul
    datatest.imagesize = data.imagesize
    lr = 0.0001
    drop = 0.75
    if(useSELU):
        drop = 0.05
    evalacc = eval(bsize=bsize, loadmodel=loadmodel, ep = ep, lr = lr, debugstep=debugStep, savepath=savedir, savemodel = save, useBnorm=useBnorm, droprate=drop, tbsize=tbsize, decay_ephoc=decayEphoc)
    print("result: " + str(evalacc))

def FreezeGraph(usecpu = False):
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True
    # create a session
    with tf.Session(config=config) as sess:
        # import best model
        print("importing...")
        saver = tf.train.import_meta_graph(os.path.join(savedir, 'saved_checkpoint-0.meta')) # graph
        print("restoring...")
        saver.restore(sess, os.path.join(savedir, 'saved_checkpoint-0')) # variables
        # get graph definition
        gd = sess.graph.as_graph_def()
        print("convt..")
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
        print("const...")
        gd = graph_util.convert_variables_to_constants(sess, gd, ["output"])

        optlib.ensure_graph_is_valid(gd)
        input_node_names = ["input_image", "phase_train", "keep_prob"]
        output_node_names = ["output"]
        placeholder_type_enum = [dtypes.float32, dtypes.bool, dtypes.float32]
        for i in range(len(placeholder_type_enum)):
            placeholder_type_enum[i] = placeholder_type_enum[i].as_datatype_enum
        print("strip...")
        gd = strip_unused_lib.strip_unused(gd, input_node_names, output_node_names, placeholder_type_enum)
        print("training nodes...")
        #gd = graph_util.remove_training_nodes(gd)
        print("fold nodes...")
        gd = optlib.fold_batch_norms(gd)
        print("fuze nodes...")
        gd = optlib.fuse_resize_and_conv(gd, output_node_names)
        optlib.ensure_graph_is_valid(gd)

        tf.train.write_graph(gd, savedir, 'frozen.pb', as_text=False)

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

def ModelTest(filename="frozen.pb", count=100):
    datatest.anglemul = 1
    filepath = os.path.join(savedir, filename)
    graph = load_graph(filepath)

    for op in graph.get_operations():
        print(op.name)
    
    x = graph.get_tensor_by_name('name/input_image:0')
    phase_train = graph.get_tensor_by_name('name/phase_train:0')
    #keep_prob = graph.get_tensor_by_name('name/keep_prob:0')
    y = graph.get_tensor_by_name('name/output:0')
    
    # We launch a Session
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True
    with tf.Session(graph=graph, config=config) as sess:
        for i in range(count):
            img, lb = datatest.batch(1)
            fetch = sess.run(y, feed_dict={ x: img, phase_train:False })
            print(lb, fetch)

if __name__ == "__main__":
    #model options
    logdir = "C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\log\\"
    savedir = "C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\model eyeclose2\\"
    modeltitle = "face2"
    #opt options
    useSELU = False
    useBnorm = True
    useWeightDecay = False
    useRateDecay = True
    useGradientClip = True
    #load data before training. less cpu use, more training time
    dataPreLoad = False
    #checkpoint
    loadCheckPoint = False
    saveCheckPoint = True

    from vision import eyemodel_closeopen
    basedir = "C:\\Library\\koi 2017\\Source\\NeuralAction\\Vision\\EyeExtract\\bin\\x64\\Debug\\Vision\\"
    p = multiprocessing.Pool(processes=16)
    data = eyemodel_closeopen.decodeData([  basedir+"[2017-08-14 오후 5-33-02] eyes\\left\\",
                                            basedir+"[2017-08-14 오후 5-33-02] eyes\\right\\",
                                            basedir+"[2017-08-14 오후 5-30-01] eyes\\left\\",
                                            basedir+"[2017-08-14 오후 5-30-01] eyes\\right\\",
                                            basedir+"[2017-08-14 오후 9-37-04] eyes\\left\\",
                                            basedir+"[2017-08-14 오후 9-37-04] eyes\\right\\",], p)
    data.imagesize = 25

    datatest = eyemodel_closeopen.decodeData([ basedir + "valid\\" ], p)
    datatest.imagesize = 25
    
    Train(True, loadmodel=False, ep=15, useBnorm=useBnorm, bsize=50, tbsize=50, debugStep=20, decayEphoc=5)
    FreezeGraph()
    ModelTest("frozen.pb", 20)