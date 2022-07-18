#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/budge:latest || error "Failed to pull Budge docker image!"

sudo docker run -d \
  --name=budge \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 8081:80 \
  -p 4431:443 \
  -v /portainer/Files/AppData/Config/Budge:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/budge:latest || error "Failed to run Budge docker container!"