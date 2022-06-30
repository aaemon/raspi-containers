#!/bin/bash

docker run -d \
  --name=jellyfin \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Dhaka \
  -p 8096:8096 \
  -p 8920:8920 `#optional` \
  -v /portainer/Files/AppData/Config/jellyfin:/config \
  -v /media/nfs/tvshows-english:/data/tvshows-english \
  -v /media/nfs/movies-english:/data/movies-english \
  -v /media/nfs/movies-hindi:/data/movies-hindi \
  -v /media/nfs/movies-bangla:/data/movies-bangla \
  -v /media/nfs/animations-english:/data/animations-english \
  --restart unless-stopped \
  lscr.io/linuxserver/jellyfin:latest