#!/bin/bash
set -e
set -x

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
scp root@slave01:~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub01
cat ~/.ssh/id_rsa.pub01 >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
chmod 700 -R ~/.ssh
scp ~/.ssh/authorized_keys root@slave01:~/.ssh/
