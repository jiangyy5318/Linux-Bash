#!/bin/bash

sudo tar xvf cudnn-7.0-linux-x64-v4.0-rc.tgz
cd cuda/include
sudo cp *.h /usr/local/cuda/include/
cd ../lib64
sudo cp lib* /usr/local/cuda/lib64/
cd /usr/local/cuda/lib64
sudo chmod +r libcudnn.so.4.0.4
sudo ln -sf libcudnn.so.4.0.4 libcudnn.so.4
sudo ln -sf libcudnn.so.4 libcudnn.so
sudo ldconfig
