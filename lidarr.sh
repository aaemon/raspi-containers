#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/lidarr:latest || error "Failed to pull Lidarr docker image!"

sudo docker run -d \
  --name=lidarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 8686:8686 \
  -v /portainer/Files/AppData/Config/Lidarr:/config \
  -v /media/nfs/music:/music 
  -v /media/nfs/downloads:/downloads 
  --restart unless-stopped \
  lscr.io/linuxserver/lidarr:latest || error "Failed to run Lidarr docker container!"