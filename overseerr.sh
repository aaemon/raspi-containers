#!/bin/bash

read -p "Time Zone: " timezone
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/overseerr:latest || error "Failed to pull Overseerr docker image!"

docker run -d \
  --name=overseerr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e "TZ=${timezone}" \
  -p 5055:5055 \
  -v /portainer/Files/AppData/Config/overseerr:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/overseerr:latest || error "Failed to run Overseerr docker container!"