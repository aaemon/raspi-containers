#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/prowlarr:develop || error "Failed to pull Prowlarr docker image!"

sudo docker run -d \
  --name=prowlarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 9696:9696 \
  -v /portainer/Files/AppData/Config/Prowlarr:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/prowlarr:latest || error "Failed to run Prowlarr docker container!"