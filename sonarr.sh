#!/bin/bash

docker run -d \
  --name=sonarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Dhaka \
  -p 8989:8989 \
  -v /portainer/Files/AppData/Config/sonarr:/config \
  -v /media/nfs/tvshows-english:/tv `#optional` \
  -v /media/nfs/downloads:/torrent/downloads `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/sonarr:latest