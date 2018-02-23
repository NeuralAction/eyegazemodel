import os
import tensorflow as tf
import matplotlib.pyplot as plt

def imshow(im, title="imshow"):
    print(im.shape)
    fig = plt.figure()
    fig.add_subplot(1,1,1)
    fig.canvas.set_window_title(title)
    plt.imshow(im)
    plt.show()
    
def TFimshow(img, title="imshow"):
    with tf.Session() as sess:
        a = img
        if(img.dtype != tf.uint8):
            a = tf.cast(img, tf.uint8)
        im = sess.run(a)
        imshow(im)

def decode_jpeg(filepath):
    return tf.image.decode_jpeg(tf.read_file(filepath))

def resize(img, width, height):
    return tf.image.resize_images(img, [height, width])