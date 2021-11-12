ARG java_version=11.0.8-jre-slim-buster

FROM openjdk:${java_version}

ARG workspace=/opt/sparkws
ENV WORKSPACE=${workspace}

RUN mkdir -p ${workspace} && \
    apt-get update -y && \
    apt-get install -y apt-utils wget && \
    apt-get install -y python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

VOLUME ${workspace}

ARG spark_version=3.2.0
ARG hadoop_version=3.2
ARG spark_dist_url=https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz

RUN wget ${spark_dist_url} && \
    tar -xf spark-${spark_version}-bin-hadoop${hadoop_version}.tgz && \
    mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/ && \
    mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs && \
    rm spark-${spark_version}-bin-hadoop${hadoop_version}.tgz

ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}
ENV SPARK_MASTER_HOST sparkmaster
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3

WORKDIR ${SPARK_HOME}
