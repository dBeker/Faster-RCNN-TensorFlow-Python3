# Tensorflow Faster R-CNN on Windows
Tensorflow Faster R-CNN for Windows and Linux by using Python 3
It is heavily inspired by the great work done [here](https://github.com/smallcorgi/Faster-RCNN_TF) and [here](https://github.com/rbgirshick/py-faster-rcnn).
Tensorflow 2.10 is the last version that supports Windows natively. TF 2.10 also supports Python 3.10 as the latest version.
Hence, this repository is capped to TF 2.10 and Python 3.10

# Instructions
1. Install python packages  
`pip install -r requirements.txt`   

2. Download dataset

3. Install coco Python API
Run `pip install ./data/coco/PythonAPI`  

4. Download pre-trained VGG16 from [here](http://download.tensorflow.org/models/vgg_16_2016_08_28.tar.gz) and place it under the folder `data\imagenet_weights\vgg16.ckpt`.  
For rest of the models, please check [here](https://github.com/tensorflow/models/tree/master/research/slim#pre-trained-models)

7. Run train.py

Notify me if there is any issue found.

