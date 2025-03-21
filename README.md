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

| Application                                | Examples        |
| :----------------------------------------- | :-------------- |
| [Fortio](./benchmark/fortio/README.md)     | `load`          |
| [sysbench](./benchmark/sysbench/README.md) | `sysbench-tpcc` |

## Data Engineering

| Application                                                                            | Examples                              |
| :------------------------------------------------------------------------------------- | :------------------------------------ |
| [Apache ActiveMQ Artemis](./data-engineering/activemq/README.md)                       | `stomp.py`                            |
| [Apache Airflow](./data-engineering/airflow/README.md)                                 | TODO                                  |
| [Apache Cassandra](./data-engineering/cassandra/README.md)                             | CQL                                   |
| [Ceph](./data-engineering/ceph/README.md)                                              | TODO                                  |
| [Apache Flink](./data-engineering/flink/README.md)                                     | Python                                |
| [Apache Hadoop](./data-engineering/hadoop/README.md)                                   | pydoop                                |
| [Apache Kafka](./data-engineering/kafka/README.md)                                     | Python, Scala                         |
| [Apache Samza](./data-engineering/samza/README.md)                                     | Java(as library)                      |
| [Apache Spark](./data-engineering/spark/README.md)                                     | `pyspark`, `spark-shell`, `spark-sql` |
| [Apache TinkerPop](./data-engineering/tinkerpop/README.md)                             | HTTP, `gremlin-console`, Alchemy.js   |
| [ClickHouse](./data-engineering/clickhouse/README.md)                                  | `clickhouse-client`, Bytebase, Python |
| [Elasticsearch](./data-engineering/elastic/README.md): Elasticsearch, FileBeat, Kibana | Java app Container                    |
| [etcd](./data-engineering/etcd/README.md)                                              | `etcdctl`, Python.                    |
| [Hazelcast](./data-engineering/hazelcast/README.md)                                    | MySQL CDC in Java                     |
| [Apache Iceberg](./data-engineering/iceberg/README.md)                                 | Spark                                 |
| [Jupyter Notebook](./data-engineering/jupyter/README.md)                               | `ipython-sql`                         |
| [MinIO](./data-engineering/minio/README.md)                                            | Python                                |
| [MongoDB](./data-engineering/mongodb/README.md)                                        | NonCluster, Cluter, stats, `wt`       |
| [MySQL](./data-engineering/mysql/README.md)                                            | 5.7, 8, Replication                   |
| [Neo4j](./data-engineering/neo4j/README.md)                                            | JavaScript                            |
| [Apache Pinot](./data-engineering/pinot/README.md)                                     | Batch, Stream                         |
| [PostgreSQL](./data-engineering/postgresql/README.md)                                  | pgAdmin                               |
| [RabbitMQ](./data-engineering/rabbitmq/README.md)                                      | Python                                |
| [Redis](./data-engineering/redis/README.md)                                            | Single, Cluster                       |
| [SQLite](./data-engineering/sqlite/README.md)                                          | sqlite-web                            |
| [Vector](./data-engineering/vector/README.md)                                          | Nginx log to ClickHouse               |
| [ZooKeeper](./data-engineering/zookeeper/README.md)                                    | -                                     |

- [Data Engineering Applications](./data-engineering/_applications/README.md)

## Ops

| Application                                     | Examples                        |
| :---------------------------------------------- | :------------------------------ |
| [Apache Skywalking](./ops/skywalking/README.md) | Java app                        |
| [Archery](./ops/archery/README.md)              | Fix bugs                        |
| [Conductor](./ops/conductor/README.md)          | Python                          |
| [CoreDNS](./ops/coredns/README.md)              | `etcd` plugin, `dig`            |
| [Coturn](./ops/coturn/README.md)                | TODO: WebRTC                    |
| [Envoy](./ops/envoy/README.md)                  | MongoDB, httpbin, JWT Auth      |
| [Flowable REST](./ops/flowable/README.md)       | -                               |
| [FreeSWITCH](./ops/freeswitch/README.md)        | TODO: RIP, Conference           |
| [Grafana](./ops/grafana/README.md)              | Loki, Fluent Bit, Tempo         |
| [HAProxy](./ops/haproxy/README.md)              | HTTP, TCP, stats                |
| [Harbor](./ops/harbor/README.md)                | None                            |
| [Istio](./ops/istio/README.md)                  | bookinfo                        |
| [Jaeger](./ops/jaeger/README.md)                | Python                          |
| [Jenkins](./ops/jenkins/README.md)              | -                               |
| [Nacos](./ops/nacos/README.md)                  | -                               |
| [Nginx](./ops/nginx/README.md)                  | -                               |
| [OpenResty](./ops/openresty/README.md)          | `lua-resty-mysql`               |
| [Portainer](./ops/portainer/README.md)          | -                               |
| [Prometheus](./ops/prometheus/README.md)        | Exporter, AlertMaanger, Grafana |
| [registry](./ops/registry/README.md)            | -                               |
| [Apache Seata](./ops/seata/README.md)           | -                               |
| [Apache Skywalking](./ops/skywalking/README.md) | OAP Server, UI, BanyanDB.       |
| [Traefik](./ops/traefik/README.md)              | Docker provider                 |
| [xxl-job](./ops/xxljob/README.md)               | Java                            |

## Security

| Application                                        | Examples                         |
| :------------------------------------------------- | :------------------------------- |
| [Keycloak](./security/keycloak/README.md)          | Admin CLI                        |
| [OPA: Open Policy Agent](./security/opa/README.md) | `opa`, Python                    |
| [OpenLDAP](./security/openldap/README.md)          | Apache Directory Studio™, Python |

## Langauge Runtime

- [Common Lisp](./language-runtime/common-lisp/README.md)

## Testing

| Application                                          | Examples    |
| :--------------------------------------------------- | :---------- |
| [Flask](./testing/flask/README.md)                   | JSON        |
| [TCP](./testing/tcp-echo/README.md)                  | Echo server |
| [MailHog](./testing/mailhog/README.md)               | `sendmail`  |
| [Testcontainers](./testing/testcontainers/README.md) | Python      |

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