#!/bin/bash

sudo docker pull lscr.io/linuxserver/jackett:latest || error "Failed to pull the latest Jackett docker image!"

docker run -d \
  --name=jackett \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Dhaka \
  -e AUTO_UPDATE=true `#optional` \
  -e RUN_OPTS=<run options here> `#optional` \
  -p 9117:9117 \
  -v /portainer/Files/AppData/Config/jackett:/config \
  -v /media/nfs/downloads:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/jackett:latest || error "Failed to run Jackett docker image!"