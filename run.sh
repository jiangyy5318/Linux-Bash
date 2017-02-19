#!/bin/bash

set -e
set -x

if [ -d "output.txt" ];then
	rm output.txt
fi
if [ "$1" = "env"  ];then
./spark-env.sh slave01 2>&1 | tee -i output.txt
fi
if [ "$1" = "start" ];then
./spark-start.sh slave01 2>&1 | tee -i output.txt
fi
if [ "$1" = "stop" ];then
./spark-stop.sh slave01 2>&1 | tee -i output.txt
fi

