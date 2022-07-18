#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/overseerr:latest || error "Failed to pull Overseerr docker image!"

sudo docker run -d \
  --name=overseerr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 5055:5055 \
  -v /portainer/Files/AppData/Config/Overseerr:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/overseerr:latest || error "Failed to run Overseerr docker container!"