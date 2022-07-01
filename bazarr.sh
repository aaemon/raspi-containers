#!/bin/bash

sudo docker pull lscr.io/linuxserver/bazarr:latest || error "Failed to pull the latest Bazarr docker image!"

docker run -d \
  --name=bazarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Dhaka \
  -p 6767:6767 \
  -v /portainer/Files/AppData/Config/bazarr:/config \
  -v /media/nfs/tvshows-english:/data/tvshows-english \
  -v /media/nfs/movies-english:/data/movies-english \
  -v /media/nfs/movies-hindi:/data/movies-hindi \
  -v /media/nfs/movies-bangla:/data/movies-bangla \
  -v /media/nfs/animations-english:/data/animations-english \
  --restart unless-stopped \
  lscr.io/linuxserver/bazarr:latest || error "Failed to run Bazarr docker image!"