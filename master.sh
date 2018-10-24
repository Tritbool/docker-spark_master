#!/bin/bash

export SPARK_MASTER_HOST=`hostname`

mkdir -p $SPARK_MASTER_LOG

mkdir /tmp/spark-events

spark-class org.apache.spark.deploy.master.Master --ip $SPARK_MASTER_HOST --port 7077 --webui-port 8080 >> $SPARK_MASTER_LOG/spark-master.out
