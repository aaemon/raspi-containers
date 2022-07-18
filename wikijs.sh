#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/wikijs:latest || error "Failed to pull WikiJS docker image!"

sudo docker run -d \
  --name=wikijs \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 3008:3000 \
  -v /portainer/Files/AppData/Config/WikiJS/config:/config \
  -v /portainer/Files/AppData/Config/WikiJS/data:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/wikijs:latest || error "Failed to run WikiJS docker image!"