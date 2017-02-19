#!/bin/bash
dir=$(pwd)
cd /etc/ld.so.conf.d/
sudo touch cuda.conf
sudo tee -a /etc/ld.so.conf.d/cuda.conf << 'EOF'
/usr/local/cuda/lib64
EOF
sudo ldconfig
cd /usr/local/cuda/samples/
sudo make all -j4
cd bin/x86_64/linux/release
./deviceQuery
cd $dir
