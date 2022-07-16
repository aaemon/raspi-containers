#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/filezilla:latest || error "Failed to pull FileZilla docker image!"

sudo docker run -d \
  --name=filezilla \
  -e PUID=1000 \
  -e PGID=1000 \
    -e TZ=${tz} \
  -p 3020:3000 \
  -v /portainer/Files/AppData/Config/FileZilla:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/filezilla:latest || error "Failed to run FileZilla docker container!"