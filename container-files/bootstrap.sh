#!/bin/sh
set -eu
log() {
  if [[ "$@" ]]; then echo "[`date +'%Y-%m-%d %T'`] $@";
  else echo; fi
}
log "Starting Docker Daemon on port: ${DOCKER_PORT}"
/usr/bin/docker daemon -H tcp://0.0.0.0:${DOCKER_PORT} -H unix:///var/run/docker.sock
