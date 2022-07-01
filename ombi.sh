#!/bin/bash

sudo docker pull lscr.io/linuxserver/ombi:latest|| error "Failed to pull the latest Ombi docker image!"

docker run -d \
  --name=ombi \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Dhaka \
  -e BASE_URL=/ombi `#optional` \
  -p 3579:3579 \
  -v /portainer/Files/AppData/Config/ombi:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/ombi:latest || error "Failed to run Ombi docker image!"