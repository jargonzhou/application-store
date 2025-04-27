# Flink

- https://hub.docker.com/_/flink
- https://nightlies.apache.org/flink/flink-docs-master/docs/deployment/resource-providers/standalone/docker/


Dashboard: `http://localhost:8081/`.

History Server Dashboard: `http://localhost:8082/`.

quickstart example:

```shell
# on jobmanager
root@89399ddb24a6:/opt/flink# ls
bin  conf  examples  lib  LICENSE  licenses  log  NOTICE  opt  plugins  README.txt
root@89399ddb24a6:/opt/flink# ./bin/flink run examples/streaming/WordCount.jar
Job has been submitted with JobID 1a8031e6b24ed7449d9b98eae5cb5ab9
Program execution finished
Job with JobID 1a8031e6b24ed7449d9b98eae5cb5ab9 has finished.
Job Runtime: 123 ms
# list all jobs
root@89399ddb24a6:/opt/flink# bin/flink list -a
No running jobs.
No scheduled jobs.
---------------------- Terminated Jobs -----------------------
17.04.2024 01:33:58 : 1a8031e6b24ed7449d9b98eae5cb5ab9 : WordCount (FINISHED)
--------------------------------------------------------------
# view job execution graph
root@89399ddb24a6:/opt/flink# bin/flink info examples/streaming/WordCount.jar
----------------------- Execution Plan -----------------------
{
  "nodes" : [ {
    "id" : 1,
    "type" : "Source: in-memory-input",
    "pact" : "Data Source",
    "contents" : "Source: in-memory-input",
    "parallelism" : 1
  }, {
    "id" : 2,
    "type" : "tokenizer",
    "pact" : "Operator",
    "contents" : "tokenizer",
    "parallelism" : 1,
    "predecessors" : [ {
      "id" : 1,
      "ship_strategy" : "FORWARD",
      "side" : "second"
    } ]
  }, {
    "id" : 4,
    "type" : "counter",
    "pact" : "Operator",
    "contents" : "counter",
    "parallelism" : 1,
    "predecessors" : [ {
      "id" : 2,
      "ship_strategy" : "HASH",
      "side" : "second"
    } ]
  }, {
    "id" : 5,
    "type" : "Sink: print-sink",
    "pact" : "Data Sink",
    "contents" : "Sink: print-sink",
    "parallelism" : 1,
    "predecessors" : [ {
      "id" : 4,
      "ship_strategy" : "FORWARD",
      "side" : "second"
    } ]
  } ]
}
--------------------------------------------------------------

No description provided.

# view configuration
root@89399ddb24a6:/opt/flink# cat conf/config.yaml 
blob:
  server:
    port: '6124'
taskmanager:
  memory:
    process:
      size: 1728m
  bind-host: 0.0.0.0
  numberOfTaskSlots: 1
jobmanager:
  execution:
    failover-strategy: region
  rpc:
    address: jobmanager
    port: 6123
  memory:
    process:
      size: 1600m
  bind-host: 0.0.0.0
rest:
  bind-address: 0.0.0.0
  address: 0.0.0.0
...
```

## Clients

### Python

```shell
$ python -m virtualenv .venv
$ source .venv/Scripts/activate
$ pip install apache-flink==1.19.0
$ pip freeze > requirements.txt

$ python word_count.py
...
+I[remember'd., 1]
```

Submit PyFlink job:

```shell
# build image
$ docker build -f pyflink.Dockerfile -t pyflink .

# on jobmanager
root@e829b4e259ed:/opt/flink# bin/flink run --python devops/python/word_count.py 
Job has been submitted with JobID 906a468ac07a1a964b046fb631c955a8
root@e829b4e259ed:/opt/flink# bin/flink list -a
No running jobs.
No scheduled jobs.
---------------------- Terminated Jobs -----------------------
17.04.2024 03:41:11 : 906a468ac07a1a964b046fb631c955a8 : insert-into_default_catalog.default_database.sink (FINISHED)
--------------------------------------------------------------
```

### CDC
* https://nightlies.apache.org/flink/flink-cdc-docs-release-3.3/docs/get-started/quickstart/mysql-to-doris/

```shell
# WSL Ubuntu
# 1. Flink
# conf/config.yaml
# jobmanager.memory.process.size: 2600m
# taskmanager.numberOfTaskSlots: 5
# taskmanager.memory.process.size: 2728m
# execution.checkpointing.interval: 3000
# lib/mysql-connector-java-8.0.27.jar
➜  flink-1.20.1 git:(main) ✗ bin/start-cluster.sh
Starting cluster.
Starting standalonesession daemon on host zhoujiagen.
Starting taskexecutor daemon on host zhoujiagen.
➜  flink-1.20.1 git:(main) ✗ export FLINK_HOME=/mnt/d/workspace/github/application-store/data-engineering/flink/cdc/flink-1.20.1

# 2. flick-cdc
# lib/flink-cdc-pipeline-connector-mysql-3.3.0.jar
# lib/flink-cdc-pipeline-connector-doris-3.3.0.jar
➜  flink-cdc-3.3.0 git:(main) ✗ bin/flink-cdc.sh ../mysql-to-doris.yaml
Pipeline has been submitted to cluster.
Job ID: 469aeb41b46381a3d8979513c1111108
Job Description: Sync MySQL Database to Doris
```

Simulate Event: DataChangeEvent, SchemaChangeEvent

```sql
-- MySQL
INSERT INTO app_db.orders (id, price) VALUES (3, 100.00);
ALTER TABLE app_db.orders ADD amount varchar(100) NULL;
UPDATE app_db.orders SET price=100.00, amount=100.00 WHERE id=1;
DELETE FROM app_db.orders WHERE id=2;

mysql> SELECT * FROM orders;
+----+--------+--------+
| id | price  | amount |
+----+--------+--------+
|  1 | 100.00 | 100.00 |
|  3 | 100.00 | NULL   |
+----+--------+--------+
2 rows in set (0.00 sec)

-- Doris
root@15d16fec4b35:~# mysql -uroot -h127.0.0.1 -P9030
MySQL [(none)]> use app_db;
MySQL [app_db]> select * from orders;
+------+--------+--------+
| id   | price  | amount |
+------+--------+--------+
|    1 | 100.00 | 100.00 |
|    3 | 100.00 | NULL   |
+------+--------+--------+
2 rows in set (0.017 sec)
```