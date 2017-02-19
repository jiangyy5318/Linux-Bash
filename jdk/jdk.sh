#!/bin/bash

set -e
set -x

if [ ! -d "/usr/lib/jvm" ];
then
	mkdir /usr/lib/jvm
fi
tar zxvf jdk-8u74-linux-x64.tar.gz -C /usr/lib/jvm
#Java env
tee -a /etc/profile  << 'EOF'
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_74
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:${JRE_HOME}/bin:$PATH
EOF

source /etc/profile
