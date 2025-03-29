FROM eclipse-temurin:8-jdk

USER root
WORKDIR /

COPY sentinel-dashboard-1.8.8.jar /

ENV SERVER_PORT=8080
ENV USERNAME=sentinel
ENV PASSWORD=sentinel

ENTRYPOINT java \
  -Dserver.port=${SERVER_PORT}  \
  -Dcsp.sentinel.dashboard.server=localhost:${SERVER_PORT} \
  -Dproject.name=sentinel-dashboard \
  -Dsentinel.dashboard.auth.username=${USERNAME} \
  -Dsentinel.dashboard.auth.password=${PASSWORD} \
  -jar \
  sentinel-dashboard-1.8.8.jar

EXPOSE ${SERVER_PORT}