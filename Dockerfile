FROM java:8

WORKDIR /opt

RUN apt-get update \ 
&& apt-get install -y wget \
&& wget http://mirror.ibcp.fr/pub/apache/spark/spark-2.3.2/spark-2.3.2-bin-hadoop2.7.tgz \
&& tar zxf spark-2.3.2-bin-hadoop2.7.tgz \
&& rm spark-2.3.2-bin-hadoop2.7.tgz

ADD spark-defaults.conf /opt/spark-2.3.2-bin-hadoop2.7/conf
ADD spark-env.sh /opt/spark-2.3.2-bin-hadoop2.7/conf
ADD log4j.properties /opt/spark-2.3.2-bin-hadoop2.7/conf

ENV SPARK_HOME /opt/spark-2.3.2-bin-hadoop2.7
ENV PATH $PATH:/opt/spark-2.3.2-bin-hadoop2.7/sbin
ENV PATH $PATH:/opt/spark-2.3.2-bin-hadoop2.7/bin
ENV SPARK_MASTER_LOG /opt/spark-2.3.2-bin-hadoop2.7/logs
ENV SPARK_MASTER_HOST `hostname`

RUN chmod +x /opt/spark-2.3.2-bin-hadoop2.7/sbin/* && chmod +x /opt/spark-2.3.2-bin-hadoop2.7/bin/*

EXPOSE 8080
EXPOSE 8091
EXPOSE 7077
EXPOSE 6066

COPY master.sh /opt

CMD ["mkdir", "-p", "$SPARK_MASTER_LOG"]
CMD ["/bin/bash", "/opt/master.sh"]
