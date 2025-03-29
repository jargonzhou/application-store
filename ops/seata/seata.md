# Apache Seata
* https://hub.docker.com/r/seataio/seata-server

Copy configurations:
```shell
docker container cp seata-server:/seata-server/resources/ conf/seata
cp conf/seata/resources/application.yml conf/seata/application.yml
```

Access `http://localhost:7091/`.