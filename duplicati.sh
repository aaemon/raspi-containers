#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/duplicati:latest || error "Failed to pull Duplicati docker image!"

sudo docker run -d \
    --name=duplicati \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=${tz} \
    -e CLI_ARGS= `#optional` \
    -p 8200:8200 \
    -v /portainer/Files/AppData/Config/duplicati/config:/config \
    -v /portainer/Files/AppData/Config/duplicati/backups:/backups \
    -v /portainer/Files/AppData/Config/duplicati/source:/source \
    --restart unless-stopped \
    lscr.io/linuxserver/duplicati:latest || error "Failed to run Duplicati docker image!"