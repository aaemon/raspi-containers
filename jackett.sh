#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/jackett:latest || error "Failed to pull Jackett docker image!"

sudo docker run -d \
  --name=jackett \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e AUTO_UPDATE=true `#optional` \
  -e RUN_OPTS=<run options here> `#optional` \
  -p 9117:9117 \
  -v /portainer/Files/AppData/Config/Jackett:/config \
  -v /media/nfs/downloads:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/jackett:latest || error "Failed to run Jackett docker container!"