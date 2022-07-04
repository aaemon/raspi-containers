#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/bazarr:latest || error "Failed to pull Bazarr docker image!"

docker run -d \
  --name=bazarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 6767:6767 \
  -v /portainer/Files/AppData/Config/bazarr:/config \
  -v /media/nfs/tvshows-english:/data/tvshows-english \
  -v /media/nfs/movies-english:/data/movies-english \
  -v /media/nfs/movies-hindi:/data/movies-hindi \
  -v /media/nfs/movies-bangla:/data/movies-bangla \
  -v /media/nfs/animations-english:/data/animations-english \
  --restart unless-stopped \
  lscr.io/linuxserver/bazarr:latest || error "Failed to run Bazarr docker container!"