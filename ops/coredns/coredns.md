# CoreDNS

- https://hub.docker.com/r/coredns/coredns
- plugin: https://github.com/coredns/coredns/blob/master/plugin.cfg

## Client

### dig

- https://linux.die.net/man/1/dig

```shell
$ dig -v
DiG 9.16.48-Ubuntu

$ dig @192.168.3.182 -p 1053 -t A -q whoami.example.org
```

## Plugins

### etcd
* https://coredns.io/plugins/etcd/

```shell
# in container etcd
$ etcdctl --endpoints=http://${NODE1}:12379 put /srv/org/devops/services/users '{"host": "192.168.3.182","port": 20020, "priority": 10, "weight": 20}'
OK
$ etcdctl --endpoints=http://${NODE1}:12379 get /srv/org/devops/services/users
/srv/org/devops/services/users
{"host": "192.168.3.182","port": 20020, "priority": 10, "weight": 20}
```

Verify using dig:

```shell
$ dig @192.168.3.182 -p 1053 -t SRV +all -q users.services.devops.org
...
;; QUESTION SECTION:
;users.services.devops.org.     IN      SRV

;; ANSWER SECTION:
users.services.devops.org. 300  IN      SRV     10 100 20020 users.services.devops.org.

;; ADDITIONAL SECTION:
users.services.devops.org. 300  IN      A       192.168.3.182
...
```

Verify using NodeJS `dns` module:

```javascript
const dns = require('node:dns');
dns.setServers(['192.168.3.182:1053'])
dns.getServers()

// A
dns.resolve4('users.services.devops.org', (err, addresses) => {
  console.log(err)
  console.log(addresses)
});
// [ '192.168.3.182' ]

// SRV
dns.resolveSrv('users.services.devops.org', (err, addresses) => {
  console.log(err)
  console.log(addresses)
});
// [
//   {
//     name: 'users.services.devops.org',
//     port: 20020,
//     priority: 10,
//     weight: 100
//   }
// ]
```

feature: Zone name as A record

```shell
# in container ectd
$ etcdctl --endpoints=http://${NODE1}:12379 del /srv/org/devops/services/users
1
$ etcdctl --endpoints=http://${NODE1}:12379 get /srv/org/devops/services/users
$ etcdctl --endpoints=http://${NODE1}:12379 put /srv/org/devops/services/users/ '{"host": "192.168.3.182","port": 20020, "priority": 10, "weight": 20}'
OK
$ etcdctl --endpoints=http://${NODE1}:12379 put /srv/org/devops/services/users/s1 '{"host": "192.168.3.182","port": 20020, "priority": 10, "weight": 20}'
OK
$ etcdctl --endpoints=http://${NODE1}:12379 put /srv/org/devops/services/users/s2 '{"host": "192.168.3.182","port": 20021, "priority": 10, "weight": 80}'
OK
$ $ etcdctl --endpoints=http://${NODE1}:12379 get --from-key '/srv/org/devops/services/users'  
/srv/org/devops/services/users/
{"host": "192.168.3.182","port": 20020, "priority": 10, "weight": 20}
/srv/org/devops/services/users/s1
{"host": "192.168.3.182","port": 20020, "priority": 10, "weight": 20}
/srv/org/devops/services/users/s2
{"host": "192.168.3.182","port": 20021, "priority": 10, "weight": 80}
```

```shell
dig @192.168.3.182 -p 1053 -t SRV +all -q users.services.devops.org

; <<>> DiG 9.18.30-0ubuntu0.20.04.2-Ubuntu <<>> @192.168.3.182 -p 1053 -t SRV +all -q users.services.devops.org
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 36505
;; flags: qr aa rd; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 4
;; WARNING: recursion requested but not available

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
; COOKIE: b6e7007b6809739f (echoed)
;; QUESTION SECTION:
;users.services.devops.org.     IN      SRV

;; ANSWER SECTION:
users.services.devops.org. 300  IN      SRV     10 16 20020 users.services.devops.org.
users.services.devops.org. 300  IN      SRV     10 16 20020 s1.users.services.devops.org.
users.services.devops.org. 300  IN      SRV     10 66 20021 s2.users.services.devops.org.

;; ADDITIONAL SECTION:
users.services.devops.org. 300  IN      A       192.168.3.182
s1.users.services.devops.org. 300 IN    A       192.168.3.182
s2.users.services.devops.org. 300 IN    A       192.168.3.182

;; Query time: 10 msec
;; SERVER: 192.168.3.182#1053(192.168.3.182) (UDP)
;; WHEN: Thu Apr 03 14:50:34 CST 2025
;; MSG SIZE  rcvd: 411
```