export ZEPPELIN_PORT=8091
export MASTER=spark://spark-master:7077
export ZEPPELIN_MEM="-Xms256m -Xmx512m -XX:MaxPermSize=512m"
export ZEPPELIN_JAVA_OPTS="-Dspark.dynamicAllocation.enabled=true"
