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
from tensorflow.python.framework import graph_util
import matplotlib
matplotlib.use('Agg')
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import random
import matplotlib.pyplot as plt
from vision import eyemodel_LR, image
import freeze_graph
import optimize_for_inference
import multiprocessing
from multiprocessing import Process, Queue
from pympler.tracker import SummaryTracker

def weight_variable(shape):
    l = len(shape)
    dev = 0.1
    if(l==4):
        dev = math.sqrt(float(2)/float(shape[0]*shape[1]*shape[3]))
    elif(l==2):
        dev = math.sqrt(float(2)/float(shape[0]))
    print(dev)
    initial = tf.truncated_normal(shape, stddev=dev)
    return tf.Variable(initial)

def bias_variable(shape):
    initial = tf.constant(0.1, shape=shape)
    return tf.Variable(initial)

def conv2d(x, W, stride = 1, pad='SAME'):
    return tf.nn.conv2d(x, W, strides=[1,stride, stride, 1], padding=pad)

def max_pool_2x2(x):
    return tf.nn.max_pool(x, ksize=[1, 2, 2, 1], strides=[1, 2, 2, 1], padding='SAME')

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
    #alpha = 1.6732632423543772848170429916717
    #scale = 1.0507009873554804934193349852946
    alpha = 1.6732632423543772848170429916717
    scale = 1.0507009873554804934193349852946
    return scale * tf.where(x >= 0.0, x, alpha * tf.nn.elu(x))

def activate(tensor):
    return relu(tensor)

def shape(tensor):
    s = tensor.get_shape()
    return tuple([s[i].value for i in range(0, len(s))])

def res_block(tensor, tensorR, ch, phase_train, useBnorm):
    if not ch % 4 == 0:
        raise Exception()
    
    pool = tensor
    poolR = tensorR
    chneck = int(ch / 4)

    #first
    W_conv = weight_variable([1, 1, ch, chneck])
    b_conv = bias_variable([chneck])

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
    W_conv = weight_variable([3, 3, chneck, chneck])
    b_conv = bias_variable([chneck])

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
    W_conv = weight_variable([1, 1, chneck, ch])
    b_conv = bias_variable([ch])

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

#evaluate new model
def eval(bsize=20, ep = 25, lr = 1e-4, debugstep=8, savepath=None, savemodel = False, useBnorm = True, dropout = 0.5):
    tracker = SummaryTracker()
    #input vars
    x_l = tf.placeholder(tf.float32, shape=[None, data.imagesize, data.imagesize, 3], name='input_image')
    x_r = tf.placeholder(tf.float32, shape=[None, data.imagesize, data.imagesize, 3], name='input_image_r')
    y_ = tf.placeholder(tf.float32, shape=[None, 2], name='input_label')
    keep_prob = tf.placeholder(tf.float32, name='keep_prob')
    phase_train = tf.placeholder(tf.bool, name='phase_train')

    print("x_l_image=", x_l)
    print("x_r_image=", x_r)

    #conv1
    W_conv1 = weight_variable([7, 7, 3, 16])
    b_conv1 = bias_variable([16])

    h_conv1 = conv2d(x_l, W_conv1, pad='SAME', stride = 2) + b_conv1
    if(useBnorm):
        h_conv1 = batch_norm(h_conv1, 16, phase_train)
    h_conv1 = activate(h_conv1)
    h_pool1 = h_conv1
    h_pool1 = max_pool_2x2(h_conv1)
    print(h_pool1)

    #conv1_r
    W_conv1R = W_conv1
    b_conv1R = b_conv1

    h_conv1R = conv2d(x_r, W_conv1R, pad='SAME', stride = 2) + b_conv1R
    if(useBnorm):
        h_conv1R = batch_norm(h_conv1R, 16, phase_train)
    h_conv1R = activate(h_conv1R)
    h_pool1R = h_conv1R
    h_pool1R = max_pool_2x2(h_conv1R)
    print(h_pool1R)

    #conv2
    W_conv2 = weight_variable([5, 5, 16, 24])
    b_conv2 = bias_variable([24])

    h_conv2 = conv2d(h_pool1, W_conv2, stride = 1) + b_conv2
    if(useBnorm):
        h_conv2 = batch_norm(h_conv2, 24, phase_train)
    h_conv2 = activate(h_conv2)
    h_pool2 = h_conv2
    h_pool2 = max_pool_2x2(h_conv2)
    print(h_pool2)

    #conv2_r
    W_conv2R = W_conv2
    b_conv2R = b_conv2

    h_conv2R = conv2d(h_pool1R, W_conv2R, stride = 1) + b_conv2R
    if(useBnorm):
        h_conv2R = batch_norm(h_conv2R, 24, phase_train)
    h_conv2R = activate(h_conv2R)
    h_pool2R = h_conv2R
    h_pool2R = max_pool_2x2(h_conv2R)
    print(h_pool2R)

    # #conv3
    W_conv3 = weight_variable([3, 3, 24, 32])
    b_conv3 = bias_variable([32])

    h_conv3 = conv2d(h_pool2, W_conv3) + b_conv3
    if(useBnorm):
        h_conv3 = batch_norm(h_conv3, 32, phase_train)
    h_conv3 = activate(h_conv3)
    h_pool3 = max_pool_2x2(h_conv3)
    print(h_pool3)

    #conv3_r
    W_conv3R = W_conv3
    b_conv3R = b_conv3

    h_conv3R = conv2d(h_pool2R, W_conv3R) + b_conv3R
    if(useBnorm):
        h_conv3R = batch_norm(h_conv3R, 32, phase_train)
    h_conv3R = activate(h_conv3R)
    h_pool3R = max_pool_2x2(h_conv3R)
    print(h_pool3R)

    # blocks
    # block, blockR = res_block(h_conv2, h_conv2R, 64, phase_train, useBnorm)
    # block, blockR = res_block(block, blockR, 64, phase_train, useBnorm)
    # block, blockR = res_block(block, blockR, 64, phase_train, useBnorm)
    # block = avg_pool_2x2(block)
    # blockR = avg_pool_2x2(blockR)
    # print(block)
    # print(blockR)

    #flatten
    h_clast = h_pool3
    h_clastR = h_pool3R
    # h_clast = block
    # h_clastR = blockR

    shape_clast = shape(h_clast)
    print(shape_clast)

    size_clast = shape_clast[1] * shape_clast[2] * shape_clast[3]
    
    h_clast_flat = tf.reshape(h_clast, [-1, size_clast])
    h_clastR_flat = tf.reshape(h_clastR, [-1, size_clast])
    h_flat = tf.concat([h_clast_flat, h_clastR_flat],1)
    print(h_flat)

    #fc1
    W_fc1 = weight_variable([size_clast * 2, 128])
    b_fc1 = bias_variable([128])

    h_fc1 = activate(tf.matmul(h_flat, W_fc1) + b_fc1)
    h_fc1 = tf.nn.dropout(h_fc1, keep_prob)
    print(h_fc1)

    #regression
    W_fclast = weight_variable([128, 2])
    b_fclast = bias_variable([2])
    
    y_nn = tf.add(tf.matmul(h_fc1, W_fclast), b_fclast, name="output")

    W_test = weight_variable([2,2])
    b_test = bias_variable([2])

    y_nn = tf.add(tf.matmul(y_nn, W_test), b_test)
    #y_nn = tf.nn.dropout(y_nn, keep_prob, name="output_do")

    #compute graph cost
    loss = tf.reduce_mean(tf.sqrt(tf.reduce_sum(tf.square(y_nn - y_), 1)))
    #loss = tf.losses.mean_squared_error(y_, y_nn)
    #loss = tf.reduce_sum(tf.square(y_nn - y_)) * 0.5
    #cross_entropy = -tf.reduce_sum(y_*tf.log(y_nn))
    print(loss)

    #accuracy
    worst_correct_prediction = tf.reduce_max(tf.sqrt(tf.reduce_sum(tf.square(y_nn - y_), 1)))
    best_correct_prediction = tf.reduce_min(tf.sqrt(tf.reduce_sum(tf.square(y_nn - y_), 1)))
    mean_correct_prediction = tf.reduce_mean(tf.sqrt(tf.reduce_sum(tf.square(y_nn - y_), 1)))
    correct_precent = 100 - mean_correct_prediction / data.anglemul * 100
    worst_percent = 100 - worst_correct_prediction / data.anglemul * 100
    best_percent = 100 - best_correct_prediction / data.anglemul * 100
    print(best_correct_prediction)

    #trainer
    # optimizer = tf.train.AdamOptimizer(lr)
    # gvs = optimizer.compute_gradients(loss)
    # capped_gvs = [(tf.clip_by_value(grad, -3., 3.), var) for grad, var in gvs]
    # train_step = optimizer.apply_gradients(capped_gvs)
    update_ops = tf.get_collection(tf.GraphKeys.UPDATE_OPS, scope='bn')
    with tf.control_dependencies(update_ops):
        train_step = tf.train.AdamOptimizer(lr).minimize(loss)

    #ready temp vars
    batch_size = bsize
    batch_img = None
    batch_label = None
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
    acc_steps = []
    acc_sum = 0.0
    acc_count = 0.0
    step_per_sec = 0
    checkpoint_state_name = "checkpoint_state"
    checkpoint_prefix = os.path.join(savedir, "saved_checkpoint")

    #init saver
    if(savemodel):
        saver = tf.train.Saver()
    
    #session init
    with tf.Session() as sess:
        sess.run(tf.global_variables_initializer())
        if(savepath != None and savemodel):
            tf.train.write_graph(sess.graph_def, '', os.path.join(savepath, "graph.pb"))
        #train loop
        for i in range(0, int(data.size * ephoc / batch_size)):
            batch_img_l, batch_img_r, batch_label = data.batch(batch_size)
            step += batch_size
            if i !=0 and i % debugstep == 0:
                #run train acc
                feeding = { x_l:batch_img_l, x_r:batch_img_r, y_:batch_label, phase_train:False, keep_prob: 1.0 }
                fetches = sess.run([loss, correct_precent, mean_correct_prediction, worst_correct_prediction, best_correct_prediction, y_nn[0], y_[0]], \
                                    feed_dict=feeding)
                #acc update
                tacc = fetches[2]
                if(acc_max < tacc):
                    acc_max = tacc
                acc_means.append(tacc)
                acc_steps.append(step)
                acc_sum += tacc
                acc_count+=1
                #run test acc
                tbatch_img_l, tbatch_img_r, tbatch_label = datatest.batch(batch_size)
                tfeeding = { x_l:tbatch_img_l, x_r:tbatch_img_r, y_:tbatch_label, phase_train:False, keep_prob: 1.0 }
                tfetches = sess.run([mean_correct_prediction, correct_precent], feed_dict=tfeeding)
                testacc = tfetches[0]
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
                    fig = plt.Figure()
                    canvas = FigureCanvasTkAgg(fig)
                    ax = fig.add_subplot(111)
                    ax.plot(acc_steps, acc_test, label="Test")
                    ax.plot(acc_steps, acc_means, label="Train")
                    ax.set_ylim([0, 0.45])
                    ax.set_xlabel("step")
                    ax.set_ylabel("mean error")
                    ax.legend(loc='upper right')
                    ax.grid(True)
                    pltname = modeltitle + " ephocs " + str(ep) + " anglemul " + str(data.anglemul) + " lr " + str(lr) + ".png"
                    pltname = "MEAN ACC " + str((testacc+acc_ephoc[-1])*0.5) +  " TEST ACC " + str(testacc) + " TRAIN ACC " + str(acc_ephoc[-1]) + " " + pltname
                    pltfile = os.path.join(savedir, pltname)
                    canvas.print_figure(pltfile)
                    fig.clf()
                    fig.clear()
                    plt.clf()
                    plt.cla()
                    plt.close()
                    print("Saved Plot : " + pltname)
                    del fig, canvas, pltfile, pltname
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
                del tbatch_img_l, tbatch_img_r, tbatch_label, tfetches, fetches, feeding, tfeeding
            #train nn
            feeding = {x_l: batch_img_l, x_r: batch_img_r, y_: batch_label, phase_train:True, keep_prob: dropout }
            t = sess.run([train_step], feed_dict=feeding)
            for item in t:
                item = None
            t.clear()
            for item in feeding:
                item = None
            feeding.clear()
            del batch_img_l, batch_img_r, batch_label, t, feeding
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

def Train(save = False):
    data.anglemul = 1
    datatest.anglemul = data.anglemul
    datatest.imagesize = data.imagesize
    lr = 0.0001
    evalacc = eval(bsize=250, ep = 200, lr = lr, debugstep=10, savepath=savedir, savemodel = save, useBnorm=True, dropout=0.5)
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

def ModelTest(filename="frozen.pb", count=100):
    datatest.anglemul = 1
    filepath = os.path.join(savedir, filename)
    graph = load_graph(filepath)

    for op in graph.get_operations():
        print(op.name)
    
    x_l = graph.get_tensor_by_name('name/input_image:0')
    x_r = graph.get_tensor_by_name('name/input_image_r:0')
    phase_train = graph.get_tensor_by_name('name/phase_train:0')
    keep_prob = graph.get_tensor_by_name('name/keep_prob:0')
    y = graph.get_tensor_by_name('name/output:0')
        
    # We launch a Session
    with tf.Session(graph=graph) as sess:
        for i in range(count):
            img_l, img_r, lb = datatest.batch(1)
            fetch = sess.run(y, feed_dict={ x_l: img_l, x_r: img_r, keep_prob:1.0, phase_train:False })
            print(lb, fetch)

def __getstate__():
    self_dict = self.__dict__.copy()
    del self_dict['p']
    return self_dict

def __setstate__(state):
    __dict__.update(state)

if __name__ == "__main__":
    p = multiprocessing.Pool(processes=16)
    
    data = eyemodel_LR.decodeData(["C:\\Library\\정올 2017\\Source\\NeuralAction\\Vision\\MPIGazeAnnotaionReader\\bin\\Debug\\save\\",
                                    "C:\\Library\\정올 2017\\Source\\NeuralAction\\Vision\\EyeGazeGen\\bin\\x64\\Debug\\Vision\\[2017-06-04 오후 10-28-31] sub coreM without Glasses - with sub\\[2017-08-13 오후 5-53-04] EyesSubModule\\"
                                    "C:\\Library\\정올 2017\\Source\\NeuralAction\\Vision\\EyeGazeGen\\bin\\x64\\Debug\\Vision\\[2017-08-02 오후 4-42-11] main - 복사본\\[2017-08-13 오후 6-04-42] EyesSubModule\\"], p)
    data.imagesize = 60

    datatest = eyemodel_LR.decodeData(["C:\\Library\\정올 2017\\Source\\NeuralAction\\Vision\\EyeGazeGen\\bin\\x64\\Debug\\Vision\\[2017-08-03 오전 1-17-11] valid\\[2017-08-13 오후 6-12-56] EyesSubModule\\"], p)
    datatest.imagesize = 60
    
    logdir = "C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\log\\"
    savedir = "C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\model eye8\\"
    modeltitle = "3conv 25 55 20"
    
    #HyperparamatersOpt()
    Train(True)
    #FreezeGraph()
    #ModelTest("frozen.pb", 20)