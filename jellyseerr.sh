#!/bin/bash

read -p "Time Zone: " timezone

echo "Waiting to pull the latest image..."

sudo docker pull fallenbagel/jellyseerr:latest || error "Failed to pull Jellyseerr docker image!"

sudo docker run -d \
  --name jellyseerr \
  -e LOG_LEVEL=debug \
  -e TZ=Asia/Dhaka \
  -p 5055:5055 \
  -v /portainer/Files/AppData/Config/jellyseerr:/app/config \
  --restart unless-stopped \
  fallenbagel/jellyseerr:latest || error "Failed to run Jellyseerr docker container!"