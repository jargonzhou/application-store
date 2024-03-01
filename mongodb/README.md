
# MongoDB

## Backup

```shell
docker exec -it mongo bash

# in container
mongodump -u root -d <database> -c <collection> -o /tmp/mongo-backup --gzip
```

```shell
# in container of another side
cd /tmp/mongo-backup/s
mongorestore -u root --gzip .
```

## Cluster

- [Docker and MongoDB](https://www.mongodb.com/compatibility/docker)
- [mongodb/mongodb-community-server](https://hub.docker.com/r/mongodb/mongodb-community-server)
- [UBI: Red Hat Universal Base Images](https://catalog.redhat.com/software/containers/ubi8/ubi/5c359854d70cc534b3a3784e?architecture=amd64&image=6541c6b9f354125509854d4a)

TODO

- [ ] HA solution with sharding and replication.
- [ ] `mongod` configurations.
- [ ] Any benchmark tools for MongoDB?
- [ ] Security setup.


```shell
adduser mongodb
groups mongodb
usermod -aG sudo mongodb
usermod -aG docker mongodb
su mongodb

chown -R mongodb:mongodb /opt/mongodb
chown -R mongodb:mongodb /mnt
```

Generate key file: [Deploy Replica Set With Keyfile Authentication](https://www.mongodb.com/docs/v6.0/tutorial/deploy-replica-set-with-keyfile-access-control/)

```shell
openssl rand -base64 756 > <path-to-keyfile>
chmod 400 <path-to-keyfile>
```

Initial cluster:

```shell
mkdir -p mongos/{db,configdb}

mkdir -p cfgsvr01/{db,configdb}
mkdir -p cfgsvr02/{db,configdb}
mkdir -p cfgsvr03/{db,configdb}

mkdir -p shardsvr01/{db,configdb}
mkdir -p shardsvr02/{db,configdb}
mkdir -p shardsvr03/{db,configdb}

```

```javascript
// docker exec -it mongodb-cfgsvr01 bash
rs.initiate({_id: "rs-cfg", configsvr: true, version: 1, members: [ { _id: 0, host : 'mongodb-cfgsvr01:27017' }, { _id: 1, host : 'mongodb-cfgsvr02:27017' }, { _id: 2, host : 'mongodb-cfgsvr03:27017' } ] })

// docker exec -it mongodb-shardsvr01 bash
rs.initiate({_id: "rs-app", configsvr: false, version: 1, members: [ { _id: 0, host : 'mongodb-shardsvr01:27017' }, { _id: 1, host : 'mongodb-shardsvr02:27017' }, { _id: 2, host : 'mongodb-shardsvr03:27017' } ] })

// docker exec -it mongos bash
sh.addShard("rs-app/mongodb-shardsvr01:27017,mongodb-shardsvr02:27017,mongodb-shardsvr02:27017")

use admin
db.createUser({user: "root", pwd: "xxx", roles:[{role: "root", db: "admin"}]});

use admin
db.createUser(
  {
    user: "app",
    pwd:  passwordPrompt(),   // or cleartext password
    roles: [ { role: "readWrite", db: "app" },
             { role: "readWrite", db: "app2" } ]
  }
)
```

Verify cluster:

```javascript
// shardsvr01
rs.status() // shardsvr01 is the PRIMARY not SECONDARY

// mongos 
use test
db.c.insertOne({'item': 'rs', 'size': 3})

// shardsvr01
use test
db.c.find()

// shardsvr02
use test
db.c.find()
// MongoServerError: not primary and secondaryOk=false - consider using db.getMongo().setReadPref() or readPreference in the connection string
db.getMongo().setReadPref('secondary')
db.c.find()
```

## Tuning

- vm.max_map_count is too low

```shell
# log
2023-12-19T05:51:15.871+00:00: vm.max_map_count is too low


sysctl vm.max_map_count

echo 9999999 > /proc/sys/vm/max_map_count

# persistent in /etc/sysctl.conf
vm.max_map_count=9999999
```

## Errors

1. permissions on /data/security.keyFile are too open

```
{"t":{"$date":"2023-11-03T04:12:24.803+00:00"},"s":"I",  "c":"ACCESS",   "id":20254,   "ctx":"main","msg":"Read security file failed","attr":{"error":{"code":30,"codeName":"InvalidPath","errmsg":"permissions on /data/security.keyFile are too open"}}}
```

```shell
chmod 600 security.keyFile
```

2. Could not connect to database using connectionString: mongodb://root:root@mongo:27017/"

```
Could not connect to database using connectionString: mongodb://root:root@mongo:27017/"
(node:7) UnhandledPromiseRejectionWarning: MongoNetworkError: failed to connect to server [mongo:27017] on first connect [MongoError: Authentication failed.
    at Connection.messageHandler (/node_modules/mongodb/lib/core/connection/connection.js:364:19)
    at Connection.emit (events.js:314:20)
    at processMessage (/node_modules/mongodb/lib/core/connection/connection.js:456:10)
    at Socket.<anonymous> (/node_modules/mongodb/lib/core/connection/connection.js:625:15)
    at Socket.emit (events.js:314:20)
    at addChunk (_stream_readable.js:297:12)
    at readableAddChunk (_stream_readable.js:272:9)
    at Socket.Readable.push (_stream_readable.js:213:10)
    at TCP.onStreamRead (internal/stream_base_commons.js:188:23) {
  ok: 0,
  code: 18,
  codeName: 'AuthenticationFailed'
}]
```

```shell
root@localhost:/opt/mongodb# docker exec -it mongo bash
root@db85548723ed:/# mongosh
test> use admin;
admin> db.createUser({user: "root", pwd: "root", roles:[{role: "root", db: "admin"}]});
```

<!-- May need to restart `mongo-express`:

```shell
docker compose -f mongo-docker-compose.yml restart mongo-express
``` -->
