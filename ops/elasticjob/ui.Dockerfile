FROM eclipse-temurin:8-jdk

# FROM ubuntu:24.04
# RUN apt-get update && apt-get install -y openjdk-8-jdk

USER root
WORKDIR /

# RUN curl https://dlcdn.apache.org/shardingsphere/elasticjob-ui-3.0.2/apache-shardingsphere-elasticjob-3.0.2-lite-ui-bin.tar.gz --output ui.tar.gz && tar zxcf ui.tar.gz && rm -rf ui.tar.gz

COPY ui.tar.gz /
RUN tar zxvf ui.tar.gz
RUN rm -rf ui.tar.gz

# FIXME: exex "$@" stop!!!
# WORKDIR /apache-shardingsphere-elasticjob-3.0.2-lite-ui-bin/bin
# RUN chmod +x start.sh
ENTRYPOINT [ "sh", "-c", "/apache-shardingsphere-elasticjob-3.0.2-lite-ui-bin/bin/start.sh" ]

EXPOSE 8088