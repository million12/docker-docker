# Docker working in a Docker

[![CircleCI Build Status](https://img.shields.io/circleci/project/million12/docker-docker/master.svg)](https://circleci.com/gh/million12/docker-docker/tree/master)
[![GitHub Open Issues](https://img.shields.io/github/issues/million12/docker-docker.svg)](https://github.com/million12/docker-docker/issues)
[![GitHub Stars](https://img.shields.io/github/stars/million12/docker-docker.svg)](https://github.com/million12/docker-docker)
[![GitHub Forks](https://img.shields.io/github/forks/million12/docker-docker.svg)](https://github.com/million12/docker-docker)  
[![Stars on Docker Hub](https://img.shields.io/docker/stars/million12/docker.svg)](https://hub.docker.com/r/million12/docker)
[![Pulls on Docker Hub](https://img.shields.io/docker/pulls/million12/docker.svg)](https://hub.docker.com/r/million12/docker)  
[![Docker Layers](https://badge.imagelayers.io/million12/docker:latest.svg)](https://hub.docker.com/r/million12/docker)

Somtimes we all need to use docker in a docker. For this purpose this [image](https://hub.docker.com/r/million12/docker/) was prepared and it's using latest version of docker from official repo. **Docker Compose** is installed too.

### Basic usage

    docker run \
      --name docker \
      -d \
      --privileged \
      million12/docker

### Custom port usage

    docker run \
      --name docker \
      -d \
      -e DOCKER_PORT=12345 \
      -p 12345:12345 \
      --privileged \
      million12/docker

**make sure to use `-p` option which exports custom port to host machine**  
**note: This image need to be run with `--privileged` option**

### Environmental Variables
`DOCKER_PORT` - Specify on which port docker daemon should listen.

Docker troubleshooting
======================

Use docker command to see if all required containers are up and running:
```
$ docker ps
```

Check logs of docker container:
```
$ docker logs docker
```

Sometimes you might just want to review how things are deployed inside a running
 container, you can do this by executing a _bash shell_ through _docker's
 exec_ command:
```
docker exec -ti docker /bin/bash
```

History of an image and size of layers:
```
docker history --no-trunc=true million12/docker | tr -s ' ' | tail -n+2 | awk -F " ago " '{print $2}'
```

## Author

Author: Przemyslaw Ozgo (<linux@ozgo.info>)

---

**Sponsored by [Prototype Brewery](http://prototypebrewery.io/)** - the new prototyping tool for building highly-interactive prototypes of your website or web app. Built on top of [Neos CMS](https://www.neos.io/) and [Zurb Foundation](http://foundation.zurb.com/) framework.
