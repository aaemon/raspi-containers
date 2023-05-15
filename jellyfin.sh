#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull jellyfin/jellyfin:latest || error "Failed to pull Jellyfin docker image!"

sudo docker run -d \
  --name=jellyfin \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 8096:8096 \
  -v /portainer/Files/AppData/Config/Jellyfin/config:/config \
  -v /portainer/Files/AppData/Config/Jellyfin/cache:/cache \
  -v /mnt/hdd/jellyfin:/data \
  --restart unless-stopped \
  jellyfin/jellyfin:latest|| error "Failed to run Jellyfin docker container!"