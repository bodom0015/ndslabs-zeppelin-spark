FROM apache/zeppelin:0.7.3


ENV SPARK_HOME=/usr/lib/spark 

# Optional environment settings:
#ENV HADOOP_CONF_DIR=/usr/lib/hadoop \
#    SPARK_SUBMIT_OPTIONS="--packages com.databricks:spark-csv_2.10:1.2.0" \
#    ZEPPELIN_INTP_CLASSPATH_OVERRIDES=/etc/hive/conf

# Install Spark
# 2.1.1.2.6.2-205
ENV APACHE_SPARK_VERSION=2.1.1 \
    SPARK_HOME=/usr/local/spark

ENV PATH $PATH:$SPARK_HOME/bin

# install Spark/Hadoop Client support
RUN mkdir -p ${SPARK_HOME} \
    && curl -sSL -o /Spark-${APACHE_SPARK_VERSION}.tar.gz http://d3kbcqa49mib13.cloudfront.net/spark-${APACHE_SPARK_VERSION}-bin-hadoop2.6.tgz \
    && tar zxf /Spark-${APACHE_SPARK_VERSION}.tar.gz -C /usr/local \
    && mv /usr/local/spark-${APACHE_SPARK_VERSION}-bin-hadoop2.6/* ${SPARK_HOME} \
# do some clean-up
    && rm -f /Spark-${APACHE_SPARK_VERSION}.tar.gz \
    && rm -fr /usr/local/spark-${APACHE_SPARK_VERSION}-bin-hadoop2.6
