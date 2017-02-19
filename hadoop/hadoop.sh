#!/bin/bash

set -x
set -e

tar -xzvf hadoop-2.7.1.tar.gz -C /usr/local/
#hadoop path
tee -a /etc/profile << 'EOF'
export HADOOP_HOME=/usr/local/hadoop-2.7.1
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"
EOF

#replace conf files
cp *.xml /usr/local/hadoop-2.7.1/etc/hadoop/
cp hadoop-env.sh /usr/local/hadoop-2.7.1/etc/hadoop/
cp slaves /usr/local/hadoop-2.7.1/etc/hadoop/

source /etc/profile
