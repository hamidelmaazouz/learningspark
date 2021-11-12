FROM hamidelmaazouz/sparkbase:s3.2.0-h3.2-j11

ARG spark_ui_port=8080

EXPOSE ${spark_ui_port} ${SPARK_MASTER_PORT}
CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out