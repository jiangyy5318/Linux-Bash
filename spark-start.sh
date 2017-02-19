#!/bin/bash

set -x
set -e
curr=$pwd

cd "$HADOOP_HOME"

if [ ! -d "/opt/hadoop" ];then
    bin/hdfs namenode -format
fi
sbin/start-dfs.sh
sbin/start-yarn.sh

cd $curr

#spark
<<JYY
cd "$SPARK_HOME"
sbin/start-master.sh

for var in $@
do
    ssh "$var" "cd $SPARK_HOME; sbin/start-slaves.sh"
done
cd $curr

gnome-open http://master:8088
gnome-open http://master:8080
spark-shell
gnome-open http://master:4040
JYY

