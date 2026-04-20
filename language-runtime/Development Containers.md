# Development Containers
* https://containers.dev/

> What are Development Containers?
>
> A development container (or dev container for short) allows you to use a container as a full-featured development environment. It can be used to run an application, to separate tools, libraries, or runtimes needed for working with a codebase, and to aid in continuous integration and testing. Dev containers can be run locally or remotely, in a private or public cloud, in a variety of [supporting tools and editors](https://containers.dev/supporting).
>
> The Development Container Specification seeks to find ways to enrich existing formats with common development specific settings, tools, and configuration while still providing a simplified, un-orchestrated single container option – so that they can be used as coding environments or for continuous integration and testing. Beyond the specification's core metadata, the spec also enables developers to quickly share and reuse container setup steps through [Features](https://containers.dev/features) and [Templates](https://containers.dev/templates).

- Python
```shell
# ghcr.io => ghcr.nju.edu.cn
$ devcontainer templates apply --workspace-folder . --template-id ghcr.nju.edu.cn/devcontainers/templates/python
$ which python
/usr/local/bin/python
$ python main.py 
Hello Dev Containers!
```

# See Also
* [Dev Container CLI](https://github.com/devcontainers/cli): A reference implementation for the specification that can create and configure a dev container from a devcontainer.json.
* [Visual Studio Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers): The Visual Studio Code Dev Containers extension lets you use a container as a full-featured development environment. It allows you to open any folder inside (or mounted into) a container and take advantage of Visual Studio Code's full feature set.