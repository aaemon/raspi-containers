#!/bin/bash

read -p "Time Zone: " tz
read -p "Password: " password
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/calibre:latest || error "Failed to pull Calibre docker image!"

sudo docker run -d \
  --name=calibre \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e PASSWORD=${password} \
  -e CLI_ARGS= `#optional` \
  -p 8080:8080 \
  -p 8081:8081 \
  -v /portainer/Files/AppData/Config/Calibre:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/calibre:latest || error "Failed to run Calibre docker container!"