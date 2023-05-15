#!/bin/bash

read -p "PLEX Claim Token: " token
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/plex:latest || error "Failed to pull Plex docker image!"

sudo docker run -d \
  --name=plex \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -e PLEX_CLAIM_TOKEN=${token} \
  -v /portainer/Files/AppData/Config/Plex:/config \
  -v /mnt/hdd/jellyfin:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/plex:latest || error "Failed to run Plex docker container!"