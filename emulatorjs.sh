#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/emulatorjs:latest || error "Failed to pull EmulatorJs docker image!"

docker run -d \
  --name=emulatorjs \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e SUBFOLDER=/ `#optional` \
  -p 3007:3000 \
  -p 8007:80 \
  -p 4007:4001 `#optional` \
  -v /portainer/Files/AppData/Config/EmulatorJs/config:/config \
  -v /portainer/Files/AppData/Config/EmulatorJs/data:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/emulatorjs:latest || error "Failed to run EmulatorJs docker container!"