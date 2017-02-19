#!/bin/bash

set -x
set -e


start=$(date +%s)
echo "install jdk"
cd jdk
./jdk.sh
cd ../
echo "successfully installed"

echo "install hadoop"
cd hadoop
./hadoop.sh
cd ../
echo "successfully installed"

echo "install spark and scala"
cd spark
./spark.sh
./scala.sh
cd ../
echo "successfully installed"

source /etc/profile
echo "copy to every slaves"
for var in $@
do
    scp -r /usr/lib/jvm root@"$var":/usr/lib
    scp -r "$HADOOP_HOME" root@"$var":/usr/local
    scp -r "$SCALA_HOME" root@"$var":/usr/local
    scp -r "$SPARK_HOME" root@"$var":/usr/local
    scp ~/.profile root@"$var":~/
    ssh "$var" "source ~/.profile"
done

stop=$(date +%s)
echo "it take $(($stop-$start)) seconds"
