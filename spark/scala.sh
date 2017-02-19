#!/bin/bash

set -e
set -x

tar -xvzf scala-2.11.7.tgz  -C /usr/local/

tee -a /etc/profile  << 'EOF'
export SCALA_HOME=/usr/local/scala-2.11.7
export PATH=$SCALA_HOME/bin:$PATH
EOF
source /etc/profile

