#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/deluge:latest || error "Failed to pull Deluge docker image!"

sudo docker run -d \
  --name=deluge \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e DELUGE_LOGLEVEL=error `#optional` \
  -p 8112:8112 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -v /portainer/Files/AppData/Config/Deluge:/config \
  -v /media/nfs/downloads:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/deluge:latest || error "Failed to run Deluge docker container!"