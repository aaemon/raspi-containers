#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/freshrss:latest || error "Failed to pull FreshRSS docker image!"

sudo docker run -d \
  --name=freshrss \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 8055:80 \
  -v /portainer/Files/AppData/Config/freshrss:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/freshrss:latest || error "Failed to run FreshRSS docker container!"