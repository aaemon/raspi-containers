#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/adguardhome-sync:latest || error "Failed to pull AdGuardHome-Sync docker image!"

docker run -d \
  --name=adguardhome-sync \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e CONFIGFILE=/config/adguardhome-sync.yaml `#optional` \
  -p 8080:8080 \
  -v /portainer/Files/AppData/Config/AdGuardHome-Sync:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/adguardhome-sync:latest || error "Failed to run AdGuardHome-Sync docker container!"