#!/bin/bash

set -x
set -e

DIR=("/opt/hadoop" "/usr/local/hadoop-2.7.1" "/usr/local/spark-2.0.0*" "/usr/local/scala*" "/usr/lib/jvm")

for var in ${DIR[@]}
do
	if [ -d $var ];then
		rm -r $var
	fi
done

cp profile /etc/
source /etc/profile
echo "$PATH"
