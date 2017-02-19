#!/bin/bash

set -e
set -x

#Spark
tar zxvf spark-2.0.0-bin-hadoop2.7.tgz  -C /usr/local

tee -a /etc/profile << 'EOF'
export SPARK_HOME=/usr/local/spark-2.0.0-bin-hadoop2.7
export PATH=$SPARK_HOME/bin:$PATH
EOF


source /etc/profile
cp slaves /usr/local/spark-2.0.0-bin-hadoop2.7/conf
cd /usr/local/spark-2.0.0-bin-hadoop2.7/conf
cp spark-env.sh.template spark-env.sh
tee -a spark-env.sh << 'EOF'
export SCALA_HOME=/usr/local/scala-2.11.7
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_74
export SPARK_MASTER=master
export SPARK_WORKER_MEMORY=1g
export HADOOP_CONF_DIR=/usr/local/hadoop-2.7.1/etc/hadoop
EOF
