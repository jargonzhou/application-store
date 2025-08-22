# Collabora Online
* https://sdk.collaboraonline.com/docs/installation/CODE_Docker_image.html
* WOPI: [WOPI REST API Reference](https://learn.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/rest/)
  * client: Collabora Online
  * host: your existing solution: web application and file storage
* [Step-by-step tutorial](https://sdk.collaboraonline.com/docs/Step_by_step_tutorial.html)
```
# see collabora-online-sdk-examples: webapp\python\wopi

# Collabora Online discovery service
GET https://<WOPI client URL>:<port>/hosting/discovery
# GetFile endpoint
GET https://<WOPI host URL>/<...>/wopi/files/<id>/contents
# CheckFileInfo endpoint
https://<WOPI host URL>/<...>/wopi/files/<id>
# see a constructed document in Collabora Online
https://<WOPI client URL>:<port>/browser/<hash>/cool.html?WOPISrc=https://<WOPI host URL>/<...>/wopi/files/<id>
# PutFile endpoint
https://<WOPI host URL>/<...>/wopi/files/<id>/contents
```

convesions:
- LOCAL_IP: local IP

Access
- `https://localhost:9980`
- admin console: `https://localhost:9980/browser/dist/admin/admin.html`


`coolwsd.xml`:
```shell
$ docker container cp collaboraonline:/etc/coolwsd/coolwsd.xml coolwsd.xml
```

# Python
* https://github.com/CollaboraOnline/collabora-online-sdk-examples//tree/master/webapp/python

```shell
$ go install github.com/jsha/minica@latest
$ minica --domains <LOCAL_IP>
```

`run_https.sh`:
```shell
export SSL_CRT_FILE=minica.pem
export SSL_KEY_FILE=minica-key.pem
export DISABLE_TLS_CERT_VALIDATION=1

exec python manage.py runserver_plus --cert-file $SSL_CRT_FILE --key-file $SSL_KEY_FILE <LOCAL_IP>:8000
```

browsers: Chrome, Edge
- https://<LOCAL_IP>:8000/
  - Load Collabora Online: https://<LOCAL_IP>:9980
```shell
# console output
loading ... https://<LOCAL_IP>:9980/browser/a8848448cc/cool.html?WOPISrc=https://<LOCAL_IP>:8000/wopi/files/1
```
- edit
- admin console: Overview > Documents open, Users online

# TODO
- user identifier
- integrate with file storages