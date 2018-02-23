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
    def __init__(self, randomize, randmul, randadd, normalize, imagesize, facesize, anglemul):
        self.randomize = randomize
        self.randmul = randmul
        self.randadd = randadd
        self.randmargin = 0.15
        self.normalize = normalize
        self.imagesize = imagesize
        self.facesize = facesize
        self.anglemul = anglemul
    
    def load_img(self, filepath, size=100):
        img_decode = misc.imread(filepath)
        if(self.randomize):
            img_width = img_decode.shape[0]
            img_margin = img_width * self.randmargin
            img_mX = img_margin * random.random()
            img_mY = img_margin * random.random()
            img_mW = int(img_width - max([img_mX, img_mY]) - img_margin * random.random())
            img_mX = int(img_mX)
            img_mY = int(img_mY)
            img_decode = img_decode[img_mX:img_mX + img_mW, img_mY:img_mY + img_mW, : ]
        img_resize = misc.imresize(img_decode, [size, size])
        img = img_resize
        if(self.randomize):
            rand_mul = (random.random() * self.randmul - self.randmul / 2) + 1
            rand_add = random.random() * (self.randadd * 2) - self.randadd
            img = img * rand_mul + rand_add
            img = img + random.random() * img.std() * np.random.random(img.shape)
            np.clip(img, 0, 255, out=img)
        if(self.normalize):
            img = img - np.average(img)
            std = np.std(img)
            if not((abs(std) < 0.01) or math.isnan(std) or math.isinf(std)):
                img = img / std
            else:
                img = img / 63.5
        del img_decode, img_resize, filepath
        return img
    
    def __call__(self, args):
        returnBat_left = []
        returnBat_right = []
        returnBat_face = []
        returnLab = []
        for item in args:
            img = self.load_img(item.filename, self.imagesize)
            rename = item.filename.replace("left", "right")
            imgR = self.load_img(rename, self.imagesize)
            rename = item.filename.replace("left", "face")
            imgF = self.load_img(rename, self.facesize)
            rod1 = item.label.rod1
            rod2 = item.label.rod2
            rod3 = item.label.rod3
            rt = 1.0 / rod3
            rod1 *= rt
            rod2 *= rt
            lb = [ rod1 * self.anglemul, rod2 * self.anglemul]
            returnBat_left.append(img)
            returnBat_right.append(imgR)
            returnBat_face.append(imgF)
            returnLab.append(lb)
            del img, imgR, imgF, lb, rod1, rod2, rod3, rename
        return ProcRet(returnBat_left, returnBat_right, returnBat_face, returnLab)

class ProcArg:
    def __init__(self, filename, label):
        self.filename = filename
        self.label = label
    def Dispose(self):
        del self.filename
        del self.label

class ProcRet:
    def __init__(self, bat_left, bat_right, bat_face, label):
        self.bat_left = bat_left
        self.bat_right = bat_right
        self.bat_face = bat_face
        self.label = label

class dataWrap:
    def __getstate__(self):
        self_dict = self.__dict__.copy()
        if 'pool' in self_dict:
            del self_dict['pool']
        return self_dict
    def __setstate__(self, state):
        self.__dict__.update(state)
    def __init__(self, image_left, label, model, pool):
        self.image_left = image_left
        self.label = label
        self.size = len(label)
        self.model = model
        self.imagesize = 160
        self.facesize = 160
        self.anglemul = 1
        self.randmul = 0.4
        self.pool=pool
        self.randadd = 20
    def batch(self, count, normalize = True, randomize = True):
        imgsize = self.imagesize
        facesize = self.facesize
        bat_left = np.empty((count,imgsize,imgsize,3), dtype='float32')
        bat_right = np.empty((count,imgsize,imgsize,3), dtype='float32')
        bat_face = np.empty((count, facesize, facesize,3), dtype='float32')
        label = np.empty((count,2), dtype='float32')
        files = []
        for i in range(16):
            files.append([])
        added = 0
        while added < count:
            ind = random.randrange(0, len(self.label))
            imgpath_left = self.image_left[ind]
            imgpath_right = imgpath_left.replace("left", "right")
            imgpath_face = imgpath_left.replace("left", "right")
            if os.path.exists(imgpath_left) and os.path.exists(imgpath_right) and os.path.exists(imgpath_face):
                filesInd = added % 16
                files[filesInd].append(ProcArg(self.image_left[ind], self.label[ind]))
                added = added + 1
            del imgpath_left, imgpath_right, imgpath_face
        proc = Processor(randomize, self.randmul, self.randadd, normalize, self.imagesize, self.facesize, self.anglemul)
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
                for im in r.bat_face:
                    bat_face[tind,:,:,:] = im
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
            for d in r.bat_face:
                d = None
            for d in r.label:
                d = None
            r.bat_left.clear()
            r.bat_right.clear()
            r.bat_face.clear()
            r.label.clear()
            del r.bat_left, r.bat_right, r.bat_face, r.label
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
        return bat_left, bat_right, bat_face, label

def decodeData(parentlist, pool):
    images_left = []
    label = []
    model = None
    for parentpath in parentlist:
        walkpath = os.path.join(parentpath, "left")
        for (path, dir, files) in os.walk(walkpath):
            for filename in files:
                ext = os.path.splitext(filename)[-1]
                if ext == ".jpg":
                    filepath = os.path.join(os.path.join(parentpath, "left"), filename)
                    name = os.path.splitext(filename)[0]
                    images_left.append(filepath)
                    label.append(decodeLabel(name))
                elif ext == ".txt":
                    modelTxt = path + filename
                    model = decodeModel(modelTxt)
    print("searched: " + str(len(images_left)))
    print("Model READ COMP")
    return dataWrap(images_left, label, model, pool)

if __name__ == "__main__":
    p = multiprocessing.Pool(processes=16)
    data = decodeData(["C:\\Library\\정올 2017\\Source\\GazeDataset\\eyesub1\\"], p)
    data.imagesize = 60
    data.facesize = 120
    decodenum = 1
    print("readFIN")
    start_time = time.time()
    bat_left, bat_right, bat_face, label = data.batch(decodenum, normalize = True, randomize = True)
    end_time = time.time()
    print("BATCH FIN")
    print(label)
    print(bat_left.shape)
    print(bat_right.shape)
    print(bat_face.shape)
    print(label.shape)
    print((end_time - start_time) / decodenum)
    show = bat_left[0]
    show = (show - show.min())
    show = show * (255.0 / show.max())
    import image
    image.imshow(show.astype(np.uint8))
