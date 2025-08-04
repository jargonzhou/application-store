# Apache Superset
* https://hub.docker.com/r/apache/superset

- use `docker-compose-image-tag.yml` files in source dode.
```shell
$ git clone https://github.com/apache/superset

# Enter the repository you just cloned
$ cd superset

# Set the repo to the state associated with the latest official version
$ git checkout tags/5.0.0

# Fire up Superset using Docker Compose
$ docker compose -f docker-compose-image-tag.yml up
```

Access `http://localhost:8088/` with `admin/admin`.