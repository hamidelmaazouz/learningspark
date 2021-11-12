FROM hamidelmaazouz/sparkbase:s3.2.0-h3.2-j11

ARG spark_ui_port=8081

EXPOSE ${spark_ui_port}
CMD bin/spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} >> logs/spark-worker.out