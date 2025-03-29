# Nginx
* https://hub.docker.com/_/nginx


Copy configuration files from container:
```shell
docker container cp nginx:/etc/nginx/nginx.conf nginx.conf
docker container cp nginx:/etc/nginx/conf.d conf.d
```

```shell
root@d9332c776d96:/etc/nginx/modules# nginx -V
nginx version: nginx/1.27.3
built by gcc 12.2.0 (Debian 12.2.0-14) 
built with OpenSSL 3.0.11 19 Sep 2023 (running with OpenSSL 3.0.15 3 Sep 2024)
TLS SNI support enabled
configure arguments: --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-compat --with-file-aio --with-threads --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_flv_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_mp4_module --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module --with-http_sub_module --with-http_v2_module --with-http_v3_module --with-mail --with-mail_ssl_module --with-stream --with-stream_realip_module --with-stream_ssl_module --with-stream_ssl_preread_module --with-cc-opt='-g -O2 -ffile-prefix-map=/data/builder/debuild/nginx-1.27.3/debian/debuild-base/nginx-1.27.3=. -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fPIC' --with-ld-opt='-Wl,-z,relro -Wl,-z,now -Wl,--as-needed -pie'
```

## Modules
* https://github.com/nginxinc/docker-nginx/tree/master/modules
* [modules/README.md](./modules/README.md) 

### ngx_http_stub_status_module
* https://nginx.org/en/docs/http/ngx_http_stub_status_module.html

