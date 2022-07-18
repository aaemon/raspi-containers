#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull fallenbagel/jellyseerr:latest || error "Failed to pull Jellyseerr docker image!"

sudo docker run -d \
  --name jellyseerr \
  -e LOG_LEVEL=debug \
  -e TZ=${tz} \
  -p 5055:5055 \
  -v /portainer/Files/AppData/Config/Jellyseerr:/app/config \
  --restart unless-stopped \
  fallenbagel/jellyseerr:latest || error "Failed to run Jellyseerr docker container!"