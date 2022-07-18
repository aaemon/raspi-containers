#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/paperless-ng:latest || error "Failed to pull Paperless-NG docker image!"

sudo docker run -d \
  --name=paperless-ng \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e REDIS_URL= `#optional` \
  -p 8005:8000 \
  -v /portainer/Files/AppData/Config/Paperless-NG/config:/config \
  -v /portainer/Files/AppData/Config/Paperless-NG/data:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/paperless-ng:latest || error "Failed to run Paperless-NG docker image!"