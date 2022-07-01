#!/bin/bash

sudo docker pull lscr.io/linuxserver/freshrss:latest || error "Failed to pull the latest FreshRSS docker image!"

docker run -d \
  --name=freshrss \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Dhaka \
  -p 8055:80 \
  -v /portainer/Files/AppData/Config/freshrss:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/freshrss:latest || error "Failed to run FreshRSS docker image!"