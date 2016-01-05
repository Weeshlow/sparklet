#!/bin/bash
echo "spark.master  spark://$HOSTNAME:7077" > /opt/spark-1.6.0-bin-hadoop2.6/conf/spark-defaults.conf
service ssh restart
/opt/spark-1.6.0-bin-hadoop2.6/sbin/start-master.sh
SPARK_WORKER_INSTANCES=2 SPARK_WORKER_CORES=1 /opt/spark-1.6.0-bin-hadoop2.6/sbin/start-slave.sh spark://$HOSTNAME:7077
eval $@
