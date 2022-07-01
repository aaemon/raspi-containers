#!/bin/bash

sudo docker pull lscr.io/linuxserver/qbittorrent:latest || error "Failed to pull the latest qBittorrent docker image!"

sudo docker run -d \
  --name=qbittorrent \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Dhaka \
  -e WEBUI_PORT=8090 \
  -p 8090:8090 \
  -p 6881:6881/tcp \
  -p 6881:6881/udp \
  -v /portainer/Files/AppData/Config/qBittorrent:/config \
  -v /media/nfs/downloads:/torrent/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/qbittorrent:latest || error "Failed to run qBittorrent docker image!"
