#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/embystat:latest || error "Failed to pull EmbyStat docker image!"

sudo docker run -d \
  --name=embystat \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 6555:6555 \
  -v /portainer/Files/AppData/Config/EmbyStat:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/embystat:latest || error "Failed to run EmbyStat docker container!"