#!/bin/bash
set -e
set -x

sudo apt-get install -y ssh rsync
sudo apt-get install -y openssh-server
sudo cp sshd_config /etc/ssh/sshd_config
service ssh restart
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> authorized_keys
sudo chmod 700 ~/.ssh/authorized_keys
sudo chmod 600 -R ~/.ssh
echo "finished"
