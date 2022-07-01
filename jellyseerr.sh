#!/bin/bash

sudo docker pull fallenbagel/jellyseerr:latest || error "Failed to pull the latest Jellyseerr docker image!"

sudo docker run -d \
  --name jellyseerr \
  -e LOG_LEVEL=debug \
  -e TZ=Asia/Dhaka \
  -p 5055:5055 \
  -v /portainer/Files/AppData/Config/jellyseerr:/app/config \
  --restart unless-stopped \
  fallenbagel/jellyseerr:latest || error "Failed to run Jellyseerr docker image!"