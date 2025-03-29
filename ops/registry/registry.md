# registry
* https://hub.docker.com/_/registry

- depolying: https://distribution.github.io/distribution/about/deploying/
- api: https://distribution.github.io/distribution/spec/api/
  - example: `http://localhost:5000/v2/_catalog`

daemon.json:
```json
{
  "insecure-registries": ["192.168.3.178:5000"]
}
```