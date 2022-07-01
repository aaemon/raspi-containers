#!/bin/bash

sudo docker pull lscr.io/linuxserver/heimdall:latest || error "Failed to pull the latest Heimdall docker image!"

docker run -d \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Dhaka \
  -p 80:80 \
  -p 443:443 \
  -v /portainer/Files/AppData/Config/heimdall:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/heimdall:latest || error "Failed to run Heimdall docker image!"