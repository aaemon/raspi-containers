#!/bin/bash

docker run -d \
  --name jellyseerr \
  -e LOG_LEVEL=debug \
  -e TZ=Asia/Dhaka \
  -p 5055:5055 \
  -v /portainer/Files/AppData/Config/jellyseerr:/app/config \
  --restart unless-stopped \
  fallenbagel/jellyseerr:latest