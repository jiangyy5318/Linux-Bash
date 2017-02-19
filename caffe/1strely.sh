#!/bin/bash

sudo apt-get install -y build-essential #basic requirement
sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler #required by caffe
sudo dpkg -i cuda-repo-*.deb
sudo apt-get update
sudo apt-get install cuda -y
#sudo chown -R jiangyy:jiangyy /usr/local/cuda
sudo -a ~/.profile << 'EOF'
export PATH=/usr/local/cuda/bin:$PATH
EOF
sudo reboot
