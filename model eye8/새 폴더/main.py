# -*- cod   ing:CP949 -*-
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

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
import random
import matplotlib.pyplot as plt
from vision import eyemodel, image
import freeze_graph
import optimize_for_inference
import multiprocessing
from multiprocessing import Process
import queue

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

def savalchan(tensor):
    scale = 1.0507009873554804934193349852964
    k=0.9444444444444444
    z=1.8
    return tf.where(tensor>=0.0,scale*tensor, 1.7/(-tensor+k)-z)

def savalchan2(tensor):
    scale = 1.0507009873554804934193349852964
    k=0.8717948717948718
    z=1.95
    return tf.where(tensor>=0.0,scale*tensor, 1.7/(-tensor+k)-z)

def savalchan3(tensor):
    scale = 1.0507009873554804934193349852964
    k=1.7453798767967146
    z=0.974
    return tf.where(tensor>=0.0,scale*tensor, 1.7/(-tensor+k)-z)

def selu(x):
    #alpha = 1.6732632423543772848170429916717
    #scale = 1.0507009873554804934193349852946
    alpha = 1.6732632423543772848170429916717
    scale = 1.0507009873554804934193349852946
    return scale * tf.where(x >= 0.0, x, alpha * tf.nn.elu(x))

def activate(tensor):
    return relu(tensor)

def batchimg(data, batch_size, que):
    a = data.batch(batch_size)
    que.put(a)

#evaluate new model
def eval(bsize=20, ep = 25, lr = 1e-4, debugstep=8, savepath=None, savemodel = False, useBnorm = True):
    #input vars
    x = tf.placeholder(tf.float32, shape=[None, data.imagesize, data.imagesize, 3], name='input_image')
    y_ = tf.placeholder(tf.float32, shape=[None, 2], name='input_label')
    keep_prob = tf.placeholder(tf.float32, name='keep_prob')
    phase_train = tf.placeholder(tf.bool, name='phase_train')

    print("x_image=", x)

    #conv1
    W_conv1 = weight_variable([11, 11, 3, 16])
    b_conv1 = bias_variable([16])

    h_conv1 = conv2d(x, W_conv1, pad='SAME', stride = 2) + b_conv1
    if(useBnorm):
        h_conv1 = batch_norm(h_conv1, 16, phase_train)
    h_conv1 = activate(h_conv1)
    h_pool1 = max_pool_2x2(h_conv1)
    print(h_pool1)

    #conv2
    W_conv2 = weight_variable([5, 5, 16, 48])
    b_conv2 = bias_variable([48])

    h_conv2 = conv2d(h_pool1, W_conv2) + b_conv2
    if(useBnorm):
        h_conv2 = batch_norm(h_conv2, 48, phase_train)
    h_conv2 = activate(h_conv2)
    h_pool2 = max_pool_2x2(h_conv2)
    print(h_pool2)

    #conv3
    W_conv3 = weight_variable([3,3,48,56])
    b_conv3 = bias_variable([56])

    h_conv3 = conv2d(h_pool2, W_conv3) + b_conv3
    if(useBnorm):
        h_conv3 = batch_norm(h_conv3, 56, phase_train)
    h_conv3 = activate(h_conv3)
    h_pool3 = max_pool_2x2(h_conv3)
    print(h_pool3)

    #conv4
    W_conv4 = weight_variable([1,1,56,56])
    b_conv4 = bias_variable([56])

    h_conv4 = conv2d(h_pool3, W_conv4) + b_conv4
    if(useBnorm):
        h_conv4 = batch_norm(h_conv4, 56, phase_train)
    h_conv4 = activate(h_conv4)
    h_pool4 = max_pool_2x2(h_conv4)
    h_pool4 = h_pool4
    print(h_pool4)

    h_clast = h_pool2

    #fc1
    size_fc1 = 8 * 8 * 48
    W_fc1 = weight_variable([size_fc1, 128])
    b_fc1 = bias_variable([128])

    h_pool4_flat = tf.reshape(h_clast, [-1, size_fc1])

    h_fc1 = activate(tf.matmul(h_pool4_flat, W_fc1) + b_fc1)
    h_fc1 = tf.nn.dropout(h_fc1, keep_prob)
    print(h_fc1)

    #fc2
    W_fc2 = weight_variable([128, 256])
    b_fc2 = bias_variable([256])

    h_fc2 = activate(tf.matmul(h_fc1, W_fc2)+b_fc2)
    h_fc2 = tf.nn.dropout(h_fc2, keep_prob)
    print(h_fc2)

    #fc3
    W_fc3 = weight_variable([256,128])
    b_fc3 = bias_variable([128])

    h_fc3 = activate(tf.matmul(h_fc2, W_fc3)+b_fc3)
    h_fc3 = tf.nn.dropout(h_fc3, keep_prob)
    print(h_fc3)

    #regression
    W_fclast = weight_variable([128, 2])
    b_fclast = bias_variable([2])
    
    y_nn = tf.add(tf.matmul(h_fc1, W_fclast), b_fclast, name="output")

    #compute graph L2Loss
    loss = tf.reduce_sum(tf.sqrt(tf.reduce_sum(tf.square(y_nn - y_), 1)))
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
    with tf.Session() as sess:
        sess.run(tf.global_variables_initializer())
        if(savepath != None and savemodel):
            tf.train.write_graph(sess.graph_def, '', os.path.join(savepath, "graph.pb"))
        #train loop
        for i in range(0, int(data.size * ephoc / batch_size)):
            if not batch_thread_run:
                batch_thread = threading.Thread(batchimg(data, batch_size, batch_queue))
                batch_thread.start()
                batch_thread_run = True
            batch_thread.join()
            del batch_thread

            batch_img, batch_label = batch_queue.get()
            
            batch_thread = threading.Thread(batchimg(data, batch_size, batch_queue))
            batch_thread.start()
            #batch_img, batch_label = data.batch(batch_size)
            step += batch_size
            if i !=0 and i % debugstep == 0:
                #run train acc
                fetches = sess.run([loss, correct_precent, mean_correct_prediction, worst_correct_prediction, best_correct_prediction, y_nn[0], y_[0]], \
                                    feed_dict={ x:batch_img, y_:batch_label, phase_train:False, keep_prob: 1.0 })
                #acc update
                tacc = fetches[2]
                if(acc_max < tacc):
                    acc_max = tacc
                acc_means.append(tacc)
                acc_steps.append(step)
                acc_sum += tacc
                acc_count+=1
                #run test acc
                tbatch_img, tbatch_label = datatest.batch(5)
                tfetches = sess.run([mean_correct_prediction, correct_precent], feed_dict={ x:tbatch_img, y_:tbatch_label, phase_train:False, keep_prob: 1.0 })
                testacc = tfetches[0]
                acc_test.append(tfetches[0])
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
                    plt.plot(acc_steps,acc_means)
                    plt.plot(acc_steps,acc_test)
                    plt.ylim([0,acc_max])
                    pltname = modeltitle + " ephocs " + str(ep) + " anglemul " + str(data.anglemul) + " lr " + str(lr) + ".png"
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
            t = sess.run([train_step], feed_dict={x: batch_img, y_: batch_label, phase_train:True, keep_prob: 0.7 })
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
    lr = 0.0002
    evalacc = eval(bsize=50, ep = 100, lr = lr, debugstep=10, savepath=savedir, savemodel = save, useBnorm=True)
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
    
    x = graph.get_tensor_by_name('name/input_image:0')
    phase_train = graph.get_tensor_by_name('name/phase_train:0')
    keep_prob = graph.get_tensor_by_name('name/keep_prob:0')
    y = graph.get_tensor_by_name('name/output:0')
        
    # We launch a Session
    with tf.Session(graph=graph) as sess:
        for i in range(count):
            img, lb = datatest.batch(1)
            fetch = sess.run(y, feed_dict={ x: img, keep_prob:1.0, phase_train:False })
            print(lb, fetch)

if __name__ == "__main__":
    p = multiprocessing.Pool(processes=16)
    # data = eyemodel.decodeData(["C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\eyes\\"])
    # data = eyemodel.decodeData(["D:\\Library\\정올 2017\\Source\\GazeDataset\\[2017-08-01 오후 11-17-48] EyesSubModule\\main\\",
    #                             "D:\Library\정올 2017\Source\GazeDataset\[2017-08-02 오후 7-15-41] EyesSubModule\\main\\"])
    data = eyemodel.decodeData(["C:\\Library\\정올 2017\\Source\\GazeDataset\\mpigaze1\\[2017-08-06 오후 5-02-06] EyesSubModule\\",
                                "C:\\Library\\정올 2017\\Source\\GazeDataset\\mpigaze1\\[2017-08-06 오후 5-13-53] EyesSubModule\\",
                                "C:\\Users\\AinL\\Documents\\Visual Studio 2017\\Projects\\DeepWorld\\MPIGazeAnnotaionReader\\bin\\Release\\save\\"], p)
    data.imagesize = 60

    # datatest = eyemodel.decodeData(["C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\eyestest\\"])
    # datatest = eyemodel.decodeData(["D:\\Library\\정올 2017\\Source\\GazeDataset\\[2017-08-01 오후 11-17-48] EyesSubModule\\valid\\",
    #                                 "D:\Library\정올 2017\Source\GazeDataset\[2017-08-02 오후 7-15-41] EyesSubModule\\valid\\"])
    datatest = eyemodel.decodeData(["C:\\Library\\정올 2017\\Source\\GazeDataset\\mpigaze1\\valid\\"], p)
    datatest.imagesize = 60

    logdir = "C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\log\\"
    savedir = "C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\model eye6\\"
    modeltitle = "3conv 25 55 20"
    
    #HyperparamatersOpt()
    #Train(True)
    FreezeGraph()
    ModelTest("frozen.pb", 20)