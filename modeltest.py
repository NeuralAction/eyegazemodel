import tensorflow as tf
from vision import eyemodel

modeldir = "C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\model eye1\\"
datasetdir = "C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\eyestest\\"

data = eyemodel.decodeData(datasetdir)
data.imagesize = 224
data.anglemul = 360

def loadGraph(path):
    with tf.gfile.FastGFile(path, 'rb') as f:
        graph_def = tf.GraphDef()
        graph_def.ParseFromString(f.read())
    with tf.Graph().as_default() as graph:
        _ = tf.import_graph_def(graph_def, name='prefix')
    return graph

def readGraphDef(path, data):
    saver = tf.train.import_meta_graph(path)
    graph = tf.get_default_graph()
    for g in graph.get_operations():
        print(g)
    with tf.Session(graph=graph) as sess:
        # To initialize values with saved data
        saver.restore(sess, data)

def run():
    print("start run")
    
    g = loadGraph(modeldir + "frozen.pb")
    for op in g.get_operations():
        print(op)
    
    # print(graph_def)
    
    # with tf.Session() as sess:
    #     for i in range(10):
    #         batch_img, batch_label = data.batch(20)
    #         inp = sess.graph.get_tensor_by_name("input_image")
    #         output = sess.graph.get_tensor_by_name("output")
    #         fetches = sess.run([output], feed_dict={inp:batch_img})
    #         print(fetches)

if __name__ == "__main__":
    readGraphDef("C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\model eye2\\24-06-2017 20-56-15 model.ckpt.meta",\
    "C:\\Users\\AinL\\Documents\\Visual Studio Code\\eyegazemodels\\model eye2\\24-06-2017 20-56-15 model.ckpt.data-00000-of-00001")