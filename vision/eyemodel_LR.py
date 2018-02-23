import codecs
import math
import multiprocessing
import os
import random
import time

import numpy as np
import scipy
from scipy import misc, ndimage


class dataLabel:
    def __init__(self, ind, rod1, rod2, rod3):
        self.ind = ind
        self.rod1 = rod1
        self.rod2 = rod2
        self.rod3 = rod3

def decodeLabel(str):
    nameSpl = str.split(",")
    return dataLabel(int(nameSpl[0]), float(nameSpl[1]), float(nameSpl[2]), float(nameSpl[3]))

class dataModel:
    def __init__(self, width, height, mmwidth, mmheight, originX, originY, originZ, sub):
        self.width = width
        self.height = height
        self.mmwidth = mmwidth
        self.mmheight = mmheight
        self.originX = originX
        self.originY = originY
        self.originZ = originZ
        self.sub = sub

def decodeModel(file):
    fmodel = open(file, "r", -1, "utf-8")
    lines = fmodel.readlines()
    model = dataModel(-1,-1,-1,-1,-1,-1,-1,None)
    for l in lines:
        spl = l.split(':')
        head = spl[0]
        content = spl[1]
        content = content.replace("\n", "")
        print(head)
        print(content)
        if head == "scr":
            spl = content.split(',')
            print(spl)
            model.width = float(spl[0])
            model.height = float(spl[1])
        elif head == "scrmm":
            spl = content.split(',')
            print(spl)
            model.mmwidth = float(spl[0])
            model.mmheight = float(spl[1])
        elif head == "scrorigin":
            spl = content.split(',')
            print(spl)
            model.originX = float(spl[0])
            model.originY = float(spl[1])
            model.originZ = float(spl[2])
        elif head == "sub":
            model.sub = content
        else:
            print("ERROR while reading model.txt " + l)
    return model

class Processor:
    def __init__(self, randomize, randmul, randadd, normalize, imagesize, anglemul):
        self.randomize = randomize
        self.randmul = randmul
        self.randadd = randadd
        self.normalize = normalize
        self.imagesize = imagesize
        self.anglemul = anglemul
    
    def load_img(self, filepath):
        img_decode = misc.imread(filepath)
        img_resize = misc.imresize(img_decode, [self.imagesize, self.imagesize])
        img = img_resize
        if(self.randomize):
            rand_mul = (random.random() * self.randmul - self.randmul / 2) + 1
            rand_add = random.random() * (self.randadd * 2) - self.randadd
            img = img * rand_mul + rand_add
            img = img + random.random() * img.std() * np.random.random(img.shape)
            np.clip(img, 0, 255, out=img)
        if(self.normalize):
            img = img / 127.5 - 1.0
            img = img - np.average(img)
        del img_decode, img_resize, filepath
        return img
    
    def __call__(self, args):
        returnBat_left = []
        returnBat_right = []
        returnLab = []
        for item in args:
            rename = item.filename.replace("left", "right")
            img = self.load_img(item.filename)
            imgR = self.load_img(rename)
            rod1 = item.label.rod1
            rod2 = item.label.rod2
            rod3 = item.label.rod3
            rt = 1.0 / rod3
            rod1 *= rt
            rod2 *= rt
            lb = [ rod1 * self.anglemul, rod2 * self.anglemul]
            returnBat_left.append(img)
            returnBat_right.append(imgR)
            returnLab.append(lb)
            del img, imgR, lb, rod1, rod2, rod3, rename
        return ProcRet(returnBat_left, returnBat_right, returnLab)

class ProcArg:
    def __init__(self, filename, label):
        self.filename = filename
        self.label = label
    def Dispose(self):
        del self.filename
        del self.label

class ProcRet:
    def __init__(self, bat_left, bat_right, label):
        self.bat_left = bat_left
        self.bat_right = bat_right
        self.label = label

class dataWrap:
    def __getstate__(self):
        self_dict = self.__dict__.copy()
        if 'pool' in self_dict:
            del self_dict['pool']
        return self_dict
    def __setstate__(self, state):
        self.__dict__.update(state)
    def __init__(self, image_left, image_right, label, model, pool):
        self.image_left = image_left
        self.image_right = image_right
        self.label = label
        self.size = len(label)
        self.model = model
        self.imagesize = 160
        self.anglemul = 1
        self.randmul = 0.4
        self.pool=pool
        self.randadd = 15
        self.debug = False
    def batch(self, count, normalize = True, randomize = True):
        imgsize = self.imagesize
        bat_left = np.empty((count,imgsize,imgsize,3), dtype='float32')
        bat_right = np.empty((count,imgsize,imgsize,3), dtype='float32')
        label = np.empty((count,2), dtype='float32')
        files = []
        for i in range(16):
            files.append([])
        added = 0
        while added < count:
            ind = random.randrange(0, len(self.label))
            imgpath_left = self.image_left[ind]
            imgpath_right = imgpath_left.replace("left", "right")
            if os.path.exists(imgpath_left) and os.path.exists(imgpath_right):
                filesInd = added % 16
                if self.debug:
                    print(self.image_left[ind])
                files[filesInd].append(ProcArg(self.image_left[ind], self.label[ind]))
                added = added + 1
            del imgpath_left, imgpath_right
        proc = Processor(randomize, self.randmul, self.randadd, normalize, self.imagesize, self.anglemul)
        results = self.pool.map(proc,files)
        ind = 0
        for r in results:
            if np.any(r.bat_left):
                tind = ind
                for im in r.bat_left:
                    bat_left[tind,:,:,:] = im
                    tind += 1
                tind = ind
                for im in r.bat_right:
                    bat_right[tind,:,:,:] = im
                    tind += 1
                tind = ind
                for lab in r.label:
                    label[tind,:] = lab
                    tind += 1
                ind += len(r.bat_left)
        for r in results:
            for d in r.bat_left:
                d = None
            for d in r.bat_right:
                d = None
            for d in r.label:
                d = None
            r.bat_left.clear()
            r.bat_right.clear()
            r.label.clear()
            r.bat_left = None
            r.bat_right = None
            r.label = None
            del r.bat_left, r.bat_right, r.label
            r = None
        for f in files:
            for p in f:
                p.Dispose()
                p = None
            f.clear()
            f = None
        results.clear()
        files.clear()
        del results, proc, files
        return bat_left, bat_right, label

def decodeData(parentlist, pool):
    images_left = []
    images_right = []
    label = []
    model = None
    for parentpath in parentlist:
        walkpath = os.path.join(parentpath, "left")
        for (path, dir, files) in os.walk(walkpath):
            for filename in files:
                ext = os.path.splitext(filename)[-1]
                if ext == ".jpg":
                    filepath = os.path.join(os.path.join(parentpath, "left"), filename)
                    filepath_right = os.path.join(os.path.join(parentpath, "right"), filename)
                    name = os.path.splitext(filename)[0]
                    images_left.append(filepath)
                    images_right.append(filepath_right)
                    label.append(decodeLabel(name))
                elif ext == ".txt":
                    modelTxt = path + filename
                    model = decodeModel(modelTxt)
    print("searched: " + str(len(images_left)))
    print("Model READ COMP")
    return dataWrap(images_left, images_right, label, model, pool)

if __name__ == "__main__":
    p = multiprocessing.Pool(processes=16)
    data = decodeData(["C:\\Library\\정올 2017\\Source\\NeuralAction\\Vision\\EyeGazeGen\\bin\\x64\\Debug\\Vision\\[2017-06-04 오후 10-28-31] sub coreM without Glasses - with sub\\[2017-08-13 오후 5-53-04] EyesSubModule\\"], p)
    data.imagesize = 60
    decodenum = 10
    print("readFIN")
    start_time = time.time()
    bat_left, bat_right, label = data.batch(decodenum, normalize = True, randomize = True)
    end_time = time.time()
    print("BATCH FIN")
    print(label)
    print(bat_left.shape)
    print(bat_right.shape)
    print(label.shape)
    print((end_time - start_time) / decodenum)
    show = bat_left[0]
    show = show - show.min()
    show = show * 127
    import image
    image.imshow(show.astype(np.uint8))
