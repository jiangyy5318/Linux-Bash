#!/bin/bash

#atlas
sudo apt-get install -y libatlas-base-dev git python-pip
dir=$(pwd)
caffe code
cd ~/
sudo git clone https://github.com/BVLC/caffe.git


cd $(dir)
sudo ./opencv.sh
sudo ./cudnn.sh
cd ~/caffe
sudo cp Makefile.config.example Makefile.config
sudo make all

sudo data/mnist/get_mnist.sh
sudo examples/mnist/create_mnist.sh

cd ~/caffe/python
for req in $(cat requirements.txt);do pip install $req;done

