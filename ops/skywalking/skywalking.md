# SkyWalking

# BanyanDB

UI: `http://localhost:17913/`

# OAP(Observability Analysis Platform) Server, UI

UI: `http://localhost:18080/`

# Java Agent
* Docker image: https://hub.docker.com/r/apache/skywalking-java-agent
* Download: https://skywalking.apache.org/downloads/

- supported list: https://skywalking.apache.org/docs/skywalking-java/latest/en/setup/service-agent/java-agent/supported-list/
- `config/agent.config`: https://skywalking.apache.org/docs/skywalking-java/latest/en/setup/service-agent/java-agent/configurations/

目录说明:

```shell
# tree
.
├── activations # 激活的组件
│   ├── apm-jdk-forkjoinpool-plugin-9.0.0.jar
│   ├── ...
├── bootstrap-plugins
├── config
│   └── agent.config
├── LICENSE
├── licenses
│   └── LICENSE-asm.txt
├── logs
│   └── skywalking-api.log
├── NOTICE
├── optional-plugins # 可选插件
│   ├── apm-customize-enhance-plugin-9.0.0.jar
│   ├── ...
├── optional-reporter-plugins
│   ├── kafka-reporter-plugin-9.0.0.jar
│   ├── lz4-java-1.6.0.jar
│   ├── snappy-java-1.1.7.3.jar
│   └── zstd-jni-1.4.3-1.jar
├── plugins # 实际使用的插件: 可以移除未使用的插件
│   ├── apm-activemq-5.x-plugin-9.0.0.jar
│   ├── ...
└── skywalking-agent.jar # The agent

8 directories, 188 files
```

例: Java应用 `java-app1`

```dockerfile
...
ENV JAVA_AGENT="-javaagent:/home/app/skywalking-agent/skywalking-agent.jar"
...
ENTRYPOINT ["sh","-c","java ${JAVA_AGENT} -jar app.jar ${JAVA_OPTS} -Dfile.encoding=UTF-8 -Dspring.profiles.active=dev"]
```

```yaml
version: '3.8'

services:
  java-app1:
    image: dev/java-app1
    container_name: java-app1
    labels:
      app.language: Java
      app.type: Backend
    volumes:
      - "/opt/apm/skywalking-agent:/home/app/skywalking-agent"
    environment:
      - "SW_AGENT_NAME=java-app1"
      - "SW_AGENT_COLLECTOR_BACKEND_SERVICES=skywalking-oap-server:11800"
    networks:
      - apm-network

networks:
  apm-network:
    external: true
```