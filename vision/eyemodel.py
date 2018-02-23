import os
import codecs
import random
import math
import numpy as np
import multiprocessing
import scipy
from scipy import ndimage
from scipy import misc

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

    def __call__(self, args):
        first = True
        returnBat = []
        returnLab = []
        for item in args:
            img_decode = misc.imread(item.filename)
            img_resize = misc.imresize(img_decode, [self.imagesize, self.imagesize])
            img = np.reshape(img_resize, [1, self.imagesize, self.imagesize, 3])
            if(self.randomize):
                rand_mul = (random.random() * self.randmul - self.randmul / 2) + 1
                rand_add = random.random() * (self.randadd * 2) - self.randadd
                img = img * rand_mul + rand_add
                np.clip(img, 0, 255, out=img)
            if(self.normalize):
                img = img / 255 * 2 - 1
            rod1 = item.label.rod1
            rod2 = item.label.rod2
            rod3 = item.label.rod3
            rt = 1.0 / rod3
            rod1 *= rt
            rod2 *= rt
            lb = [[ rod1 * self.anglemul,
                    rod2 * self.anglemul]]
            if(first):
                returnBat = img
                returnLab = lb
                first = False
            else:
                returnBat = np.concatenate([returnBat, img], 0)
                returnLab = np.concatenate([returnLab, lb], 0)
            del img_decode, img_resize, img, lb, rod1, rod2, rod3
        return ProcRet(returnBat, returnLab)

class ProcArg:
    def __init__(self, filename, label):
        self.filename = filename
        self.label = label

class ProcRet:
    def __init__(self, bat, label):
        self.bat = bat
        self.label = label

class dataWrap:
    def __init__(self, image, label, model, pool):
        self.image = image
        self.label = label
        self.size = len(label)
        self.model = model
        self.imagesize = 160
        self.anglemul = 1
        self.randmul = 0.4
        self.pool=pool
        self.randadd = 10
    def batch(self, count, normalize = True, randomize = True):
        bat = []
        label = []
        files = []
        for i in range(16):
            files.append([])
        for i in range(count):
            filesInd = i % 16
            ind = random.randrange(0, len(self.label))
            files[filesInd].append(ProcArg(self.image[ind], self.label[ind]))
        proc=Processor(randomize, self.randmul, self.randadd, normalize, self.imagesize, self.anglemul)
        results=self.pool.map(proc,files)
        for r in results:
            if np.any(r.bat):
                if np.any(bat):
                    bat = np.concatenate([bat, r.bat], 0)
                    label = np.concatenate([label, r.label], 0)
                else:
                    bat = r.bat
                    label = r.label
        del results, proc, files
        return bat, label

def decodeData(parentlist, pool):
    images = []
    label = []
    model = None
    for parentpath in parentlist:
        for (path, dir, files) in os.walk(parentpath):
            for filename in files:
                ext = os.path.splitext(filename)[-1]
                if ext == ".jpg":
                    filepath = path + filename
                    name = os.path.splitext(filename)[0]
                    images.append(filepath)
                    label.append(decodeLabel(name))
                elif ext == ".txt":
                    modelTxt = path + filename
                    model = decodeModel(modelTxt)
    print("searched: " + str(len(images)))
    print("model: " + str(model.width))
    print("Model READ COMP")
    return dataWrap(images, label, model, pool)

if __name__ == "__main__":
    p = multiprocessing.Pool(processes=16)
    data = decodeData(["C:\\Library\\정올 2017\\Source\\GazeDataset\\mpigaze1\\[2017-08-05 오후 7-28-11] EyesSubModule\\",
                        "C:\\Library\\정올 2017\\Source\\GazeDataset\\mpigaze1\\[2017-08-05 오후 7-26-58] EyesSubModule\\",
                        "C:\\Users\\AinL\\Documents\\Visual Studio 2017\\Projects\\DeepWorld\\MPIGazeAnnotaionReader\\bin\\Release\\save\\"], p)
    data.imagesize = 120
    print("readFIN")
    bat, label = data.batch(500, normalize = True, randomize = True)
    print("BATCH FIN")
    print(bat)
    print(label)
    print(bat.shape)
    print(label.shape)