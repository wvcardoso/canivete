#!/bin/bash

MOVIES=/home/willian/Videos/

docker run -d --volume ./data:/config/data --volume $MOVIES:/mnt/share1 --device /dev/dri:/dev/dri --publish 8096:8096 --publish 8920:8920 --env UID=1000 --env GID=100 --env GIDLIST=100 emby/embyserver:latest

