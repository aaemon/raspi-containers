#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull tautulli/tautulli:latest || error "Failed to pull Tautulli docker image!"

sudo docker run -d \
  --name=tautulli \
  --restart=unless-stopped \
  -v /portainer/Files/AppData/Config/Tautulli:/config \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 8181:8181 \
  tautulli/tautulli:latest || error "Failed to run Tautulli docker container!"