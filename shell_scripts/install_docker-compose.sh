#!/bin/bash

# pre-requisitos
# packages
# - curl

_DOCKER_COMPOSE_VERSION="1.25.5"
_URL="https://github.com/docker/compose/releases/download/$_DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)"

/usr/bin/sudo /usr/bin/curl -L $_URL -o /tmp/docker-compose
/usr/bin/sudo /usr/bin/mv /tmp/docker-compose /usr/bin/
/usr/bin/sudo /usr/bin/chmod +x /usr/bin/docker-compose
/usr/bin/docker-compose -version