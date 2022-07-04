#!/bin/bash

read -p "Time Zone: " timezone

echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/nextcloud:latest || error "Failed to latest NextCloud docker image!"

docker run -d \
  --name=nextcloud \
  -e PUID=1000 \
  -e PGID=1000 \
  -e "TZ=${timezone}" \
  -p 443:443 \
  -v /portainer/Files/AppData/Config/nextcloud:/config \
  -v /media/nfs/nextcloud:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/nextcloud:latest || error "Failed to run NextCloud docker container!"