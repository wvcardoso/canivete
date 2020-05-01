#!/bin/bash -x

MOVIES=/home/willian/Videos/

cd "$(dirname "$0")"
docker container prune -f
docker run -d --volume $PWD/config:/config --volume $MOVIES:/mnt/share1 --device /dev/dri:/dev/dri --publish 80:8096 --publish 8920:8920 --env UID=1000 --env GID=100 --env GIDLIST=100 --name emby emby/embyserver:latest

