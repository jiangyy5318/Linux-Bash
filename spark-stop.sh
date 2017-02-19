#!/bin/bash

set -e
set -x

curr=$pwd
#stop spark
cd "$SPARK_HOME"
sbin/stop-master.sh
for var in $@
do
	ssh "$var" "cd $SPARK_HOME;sbin/stop-slaves.sh"
done

cd "$HADOOP_HOME"
sbin/stop-yarn.sh
sbin/stop-dfs.sh

