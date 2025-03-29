# Keycloak

- https://www.keycloak.org/
- https://quay.io/repository/keycloak/keycloak

Access `http://localhost:19001/` > 'Administration Console' with `admin/admin`.

## Admin CLI

> An example from '11. Security: Authentication and SPA' in 'Cloud Native Spring in Action'.

```shell
$ cd /opt/keycloak/bin/

# login
./kcadm.sh config credentials --server http://localhost:8080 --realm master --user admin --password admin
Logging into http://localhost:8080 as user admin of realm master

# create realm
./kcadm.sh create realms -s realm=bookstore -s enabled=true

# create user and roles, do user role assignment
./kcadm.sh create roles -r bookstore -s name=employee
./kcadm.sh create roles -r bookstore -s name=customer

./kcadm.sh create users -r bookstore \
  -s username=isabelle \
  -s firstName=Isabelle \
  -s lastName=Dahl \
  -s enabled=true
./kcadm.sh set-password -r bookstore --username isabelle --new-password isabelle
./kcadm.sh add-roles -r bookstore \
  --uusername isabelle \
  --rolename employee \
  --rolename customer 

./kcadm.sh create users -r bookstore \
  -s username=bjorn \
  -s firstName=Bjorn \
  -s lastName=Vinterberg \
  -s enabled=true
./kcadm.sh set-password -r bookstore --username bjorn --new-password bjorn
./kcadm.sh add-roles -r bookstore \
  --uusername bjorn \
  --rolename employee

# create client
./kcadm.sh create clients -r bookstore \
  -s clientId=edge-service \
  -s enabled=true \
  -s publicClient=false \
  -s secret=bookstore-edge-service-secret \
  -s 'redirectUris=["http://192.168.3.182:9000","http://192.168.3.182:9000/login/oauth2/code/*"]'
```

### example realm values

- http://localhost:18080/realms/bookstore/account
- http://localhost:18080/realms/bookstore/.well-known/openid-configuration
