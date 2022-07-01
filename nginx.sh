#!/bin/bash

sudo docker pull lscr.io/linuxserver/nginx:latest || error "Failed to pull the latest Nginx docker image!"

sudo docker run -d \
  --name=nginx \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Dhaka \
  -p 80:80 \
  -p 443:443 \
  -v /portainer/Files/AppData/Config/nginx:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/nginx:latest || error "Failed to run Nginx docker image!"
