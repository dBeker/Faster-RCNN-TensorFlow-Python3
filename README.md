# tf-faster-rcnn
Tensorflow Faster R-CNN for Windows and Linux by using Python 3

This is the branch to compile Faster R-CNN on Windows and Linux. It is heavily inspired by the great work done [here](https://github.com/smallcorgi/Faster-RCNN_TF) and [here](https://github.com/rbgirshick/py-faster-rcnn). I have not implemented anything new but I fixed the implementations for Windows, Linux and Python 3.

Currently, this repository supports Python 3.5, 3.6 and 3.7. Thanks to @morpheusthewhite

### PLEASE BE AWARE: I do not have time or intention to fix all the issues for this branch as I do not use it commercially. I created this branch just for fun. If you want to make any commitment, it is more than welcome. Tensorflow has already released an object detection api. Please refer to it. https://github.com/tensorflow/models/tree/master/research/object_detection

### If you find a solution to an existing issue in the code, please send a PR for it.

### Also, instead of trying to deal with Tensorflow, use Chainer. It is ready to be used with all the common models https://github.com/chainer/chainercv & https://github.com/chainer/chainer . I can reply all of your questions about Chainer

# How To Use This Branch
1. Install tensorflow, preferably GPU version. Follow [instructions]( https://www.tensorflow.org/install/install_windows). If you do not install GPU version, you need to comment out all the GPU calls inside code and replace them with relavent CPU ones.

2. Checkout this branch

3. Install python packages (cython, python-opencv, easydict) by running  
`pip install -r requirements.txt`   
(if you are using an environment manager system such as `conda` you should follow its instruction)

4. Go to  ./data/coco/PythonAPI  
Run `python setup.py build_ext --inplace`  
Run `python setup.py build_ext install`  
Go to ./lib/utils and run `python setup.py build_ext --inplace`

5. Follow [these instructions](https://github.com/rbgirshick/py-faster-rcnn#beyond-the-demo-installation-for-training-and-testing-models) to download PyCoco database.
I will be glad if you can contribute with a batch script to automatically download and fetch. The final structure has to look like  
`data\VOCDevkit2007\VOC2007`  

1. Download pre-trained VGG16 from [here](http://download.tensorflow.org/models/vgg_16_2016_08_28.tar.gz) and place it as `data\imagenet_weights\vgg16.ckpt`.  
For rest of the models, please check [here](https://github.com/tensorflow/models/tree/master/research/slim#pre-trained-models)

7. Run train.py

Notify me if there is any issue found.

