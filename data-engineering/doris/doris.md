# Doris
* https://doris.apache.org/docs/gettingStarted/quick-start
* standalone: https://hub.docker.com/r/yagagagaga/doris-standalone

what does `priority_networks` mean?

the docker-compose set up in 'quick-start' only works in container!!!

```shell
mysql -uroot -P9030 -h127.0.0.1 -e 'SELECT `host`, `join`, `alive` FROM frontends()'
mysql -uroot -P9030 -h127.0.0.1 -e 'SELECT `host`, `alive` FROM backends()'
```

using standalone:
- FE UI: http://127.0.0.1:8030/
- BE UI: http://127.0.0.1:8040/

```sql
SELECT `host`, `join`, `alive` FROM frontends();
SELECT `host`, `alive` FROM backends();

SHOW frontends;
SHOW backends;
```
