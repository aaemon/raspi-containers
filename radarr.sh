#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/radarr:latest || error "Failed to pull Radarr docker image!"

sudo docker run -d \
  --name=radarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 7878:7878 \
  -v /portainer/Files/AppData/Config/radarr:/config \
  -v /media/nfs/movies-english:/movies-english `#optional` \
  -v /media/nfs/movies-hindi:/movies-hindi `#optional` \
  -v /media/nfs/movies-bangla:/movies-bangla `#optional` \
  -v /media/nfs/animations-english:/animations-english `#optional` \
  -v /media/nfs/downloads:/torrent/downloads `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/radarr:latest || error "Failed to run Radarr docker container!"