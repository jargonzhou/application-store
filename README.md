# application-store
Collections of kickoff setup scripts and demonstration examples for applications.

Conventions:

- Use `DEPLOY_ENV` to mark custom settings.
- Use `192.168.3.182` as host IP.

Environments:

- Windows
  - Docker Destop 4.22.1 (118664)
  - Docker Engine v24.0.5
  - Kubernetes v1.27.2

References:
- [Docker Compose Specification](https://github.com/compose-spec/compose-spec)

## Benchmark

| Application                                  | Examples        |
| :------------------------------------------- | :-------------- |
| [Fortio](./benchmark/fortio/fortio.md)       | `load`          |
| [sysbench](./benchmark/sysbench/sysbench.md) | `sysbench-tpcc` |

## Data Engineering

| Application                                                      | Examples                                            |
| :--------------------------------------------------------------- | :-------------------------------------------------- |
| [Apache ActiveMQ Artemis](./data-engineering/activemq/README.md) | `stomp.py`                                          |
| [Apache Airflow](./data-engineering/airflow/airflow.md)          | TODO                                                |
| [Apache Cassandra](./data-engineering/cassandra/README.md)       | CQL                                                 |
| [Ceph](./data-engineering/ceph/README.md)                        | TODO                                                |
| [Apache Flink](./data-engineering/flink/flink.md)                | Python                                              |
| [Apache Hadoop](./data-engineering/hadoop/README.md)             | pydoop                                              |
| [Apache Kafka](./data-engineering/kafka/kafka.md)                | Python, Scala                                       |
| [Apache Samza](./data-engineering/samza/README.md)               | Java(as library)                                    |
| [Apache Spark](./data-engineering/spark/spark.md)                | `pyspark`, `spark-shell`, `spark-sql`               |
| [Apache TinkerPop](./data-engineering/tinkerpop/README.md)       | HTTP, `gremlin-console`, Alchemy.js                 |
| [ClickHouse](./data-engineering/clickhouse/README.md)            | `clickhouse-client`, Bytebase, Python               |
| [Elasticsearch](./data-engineering/elastic/elastic.md)           | Elasticsearch, FileBeat, Kibana. Java app Container |
| [etcd](./data-engineering/etcd/etcd.md)                          | `etcdctl`, Python.                                  |
| [Hazelcast](./data-engineering/hazelcast/README.md)              | MySQL CDC in Java                                   |
| [Apache Iceberg](./data-engineering/iceberg/README.md)           | Spark                                               |
| [Jupyter Notebook](./data-engineering/jupyter/jupyter.md)        | `ipython-sql`                                       |
| [MinIO](./data-engineering/minio/minio.md)                       | Python                                              |
| [MongoDB](./data-engineering/mongodb/README.md)                  | NonCluster, Cluter, stats, `wt`                     |
| [MySQL](./data-engineering/mysql/README.md)                      | 5.7, 8, Replication                                 |
| [Neo4j](./data-engineering/neo4j/README.md)                      | JavaScript                                          |
| [Apache Pinot](./data-engineering/pinot/README.md)               | Batch, Stream                                       |
| [PostgreSQL](./data-engineering/postgresql/README.md)            | pgAdmin                                             |
| [RabbitMQ](./data-engineering/rabbitmq/rabbitmq.md)              | Python                                              |
| [Redis](./data-engineering/redis/README.md)                      | Single, Cluster                                     |
| [SQLite](./data-engineering/sqlite/README.md)                    | sqlite-web                                          |
| [Vector](./data-engineering/vector/README.md)                    | Nginx log to ClickHouse                             |
| [ZooKeeper](./data-engineering/zookeeper/zookeeper.md)           | Single, Cluster                                     |

- [Data Engineering Applications](./data-engineering/_applications/README.md)

## Ops

| Application                                         | Examples                        |
| :-------------------------------------------------- | :------------------------------ |
| [Archery](./ops/archery/archery.md)                 | Fix bugs                        |
| [Conductor](./ops/conductor/conductor.md)           | Python                          |
| [CoreDNS](./ops/coredns/coredns.md)                 | `etcd` plugin, `dig`            |
| [Coturn](./ops/coturn/coturn.md)                    | TODO: WebRTC                    |
| [ElasticJob](./ops/elasticjob/elasticjob.md)        | -                               |
| [Envoy](./ops/envoy/envoy.md)                       | MongoDB, httpbin, JWT Auth      |
| [Flowable REST](./ops/flowable/flowable.md)         | -                               |
| [FreeSWITCH](./ops/freeswitch/freeswitch.md)        | TODO: RIP, Conference           |
| [Grafana](./ops/grafana/grafana.md)                 | Loki, Fluent Bit, Tempo         |
| [HAProxy](./ops/haproxy/haproxy.md)                 | HTTP, TCP, stats                |
| [Harbor](./ops/harbor/harbor.md)                    | None                            |
| [Istio](./ops/istio/istio.md)                       | bookinfo                        |
| [Jaeger](./ops/jaeger/jaeger.md)                    | Python                          |
| [Jenkins](./ops/jenkins/jenkins.md)                 | -                               |
| [Nacos](./ops/nacos/nacos.md)                       | -                               |
| [Nginx](./ops/nginx/nginx.md)                       | -                               |
| [OpenResty](./ops/openresty/openresty.md)           | `lua-resty-mysql`               |
| [Portainer](./ops/portainer/portainer.md)           | -                               |
| [Prometheus](./ops/prometheus/prometheus.md)        | Exporter, AlertMaanger, Grafana |
| [registry](./ops/registry/registry.md)              | -                               |
| [Apache Seata](./ops/seata/seata.md)                | -                               |
| [Sentinel Dashboard](./ops/sentinel/sentinel.md)    | -                               |
| [Apache Skywalking](./ops/skywalking/skywalking.md) | OAP Server, UI, BanyanDB.       |
| [Traefik](./ops/traefik/traefik.md)                 | Docker provider                 |
| [xxl-job](./ops/xxljob/xxljob.md)                   | Java                            |

## Security

| Application                                     | Examples                         |
| :---------------------------------------------- | :------------------------------- |
| [Keycloak](./security/keycloak/keycloak.md)     | Admin CLI                        |
| [OPA: Open Policy Agent](./security/opa/opa.md) | `opa`, Python                    |
| [OpenLDAP](./security/openldap/openldap.md)     | Apache Directory Studio™, Python |

## Langauge Runtime

- [Common Lisp](./language-runtime/common-lisp/README.md)

## Testing

| Application                                                  | Examples    |
| :----------------------------------------------------------- | :---------- |
| [Flask](./testing/flask/flask.md)                            | JSON        |
| [TCP](./testing/tcp-echo/README.md)                          | Echo server |
| [MailHog](./testing/mailhog/mailhog.md)                      | `sendmail`  |
| [Testcontainers](./testing/testcontainers/testcontainers.md) | Python      |

## Applications

- [Vert.x in Action](https://github.com/zhoujiagen/learning-cloudnative/tree/main/compute/java-reactive/vertx/vertx-in-action-application/ops/components)
  - MailHog
  - PostgreSQL
  - MongoDB
  - ActiveMQ
  - Kafka
- Cloud Native Spring in Action
  - PostgreSQL
- [GraphQL in Action](https://github.com/zhoujiagen/learning-cloudnative/tree/main/networking/graphql/ex-azdev/ops)
  - PostgreSQL
  - MongoDB
- [Event Streams in Action](https://github.com/zhoujiagen/learning-cloudnative/tree/main/compute/event-streams/event-streams-in-action)
  - Samza
- [Single Page Web Applications](https://github.com/zhoujiagen/learning-frontend-stack/tree/main/spa/spa-server/ops)
  - MongoDB
- [Full Stack GraphQL Applications](https://github.com/zhoujiagen/learning-cloudnative/tree/main/networking/graphql/full-stack-graphql-applications)
  - Neo4j