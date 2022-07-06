#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/medusa:latest || error "Failed to pull Medusa docker image!"

sudo docker run -d \
  --name=medusa \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 8081:8081 \
  -v /portainer/Files/AppData/Config/medusa:/config \
  -v /media/nfs/downloads:/downloads \
  -v /media/nfs/tvshows-english:/tv \
  --restart unless-stopped \
  lscr.io/linuxserver/medusa:latest || error "Failed to run Medusa docker container!"