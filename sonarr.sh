#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/sonarr:latest || error "Failed to pull Sonarr docker image!"

sudo docker run -d \
  --name=sonarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 8989:8989 \
  -v /portainer/Files/AppData/Config/Sonarr:/config \
  -v /media/nfs/tvshows-english:/tvshows-english `#optional` \
  -v /media/nfs/downloads:/torrent/downloads `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/sonarr:latest || error "Failed to run Sonarr docker container!"