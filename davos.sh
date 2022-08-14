#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/davos:latest || error "Failed to pull Davos docker image!"

sudo docker run -d \
  --name=davos \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 8080:8080 \
  -v /portainer/Files/AppData/Config/Davos:/config \
  -v /media/downloads:/download \
  --restart unless-stopped \
  lscr.io/linuxserver/davos:latest || error "Failed to run Davos docker container!"