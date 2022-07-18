#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/heimdall:latest || error "Failed to pull Heimdall docker image!"

sudo docker run -d \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 80:80 \
  -p 443:443 \
  -v /portainer/Files/AppData/Config/Heimdall:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/heimdall:latest || error "Failed to run Heimdall docker container!"