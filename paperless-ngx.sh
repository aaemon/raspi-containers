#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/paperless-ngx:latest || error "Failed to pull Paperless-NGX docker image!"

sudo docker run -d \
  --name=paperless-ngx \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e REDIS_URL= `#optional` \
  -p 8006:8000 \
  -v /portainer/Files/AppData/Config/paperless-ngx/config:/config \
  -v /portainer/Files/AppData/Config/paperless-ng/data:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/paperless-ngx:latest || error "Failed to run Paperless-NGX docker image!"