#!/bin/bash

read -p "Time Zone: " timezone
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/prowlarr:develop || error "Failed to pull Prowlarr docker image!"

sudo docker run -d \
  --name=prowlarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e "TZ=${timezone}" \
  -p 9696:9696 \
  -v /portainer/Files/AppData/Config/prowlarr:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/prowlarr:develop || error "Failed to run Prowlarr docker container!"