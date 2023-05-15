#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/bazarr:latest || error "Failed to pull Bazarr docker image!"

sudo docker run -d \
  --name=bazarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 6767:6767 \
  -v /portainer/Files/AppData/Config/Bazarr:/config \
  -v /mnt/hdd/jellyfin:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/bazarr:latest || error "Failed to run Bazarr docker container!"