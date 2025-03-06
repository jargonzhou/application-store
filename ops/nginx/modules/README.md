# Modules

```shell
# before
cd my-nginx
curl -o Dockerfile https://raw.githubusercontent.com/nginxinc/docker-nginx/master/modules/Dockerfile

# after
cd ..
docker compose up --build -d
```

## Nginx virtual host traffic status module
* https://github.com/vozlt/nginx-module-vts
* nginx-vts-exporter: https://github.com/sysulq/nginx-vts-exporter

```shell
mkdir vts
echo "https://github.com/vozlt/nginx-module-vts/archive/refs/tags/v0.2.3.tar.gz" > vts/source
```

TODO: recap with fine network connection