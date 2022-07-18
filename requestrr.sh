#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/requestrr:latest || error "Failed to pull Requestrr docker image!"

sudo docker run -d \
  --name=requestrr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 4545:4545 \
  -v /portainer/Files/AppData/Config/Requestrr:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/requestrr:latest || error "Failed to run Requestrr docker container!"