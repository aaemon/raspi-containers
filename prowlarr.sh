#!/bin/bash

docker run -d \
  --name=prowlarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Dhaka \
  -p 9696:9696 \
  -v /portainer/Files/AppData/Config/prowlarr:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/prowlarr:develop