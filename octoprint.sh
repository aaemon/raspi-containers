#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull octoprint/octoprint:latest || error "Failed to pull OctoPrint docker image!"

sudo docker run -d \
  --name=octoprint \
  -p 8055:80 \
  -v /portainer/Files/AppData/Config/OctoPrint:/octoprint \
  -v /dev:/dev \
  -e ENABLE_MJPG_STREAMER=true \
  --restart unless-stopped \
  --privileged \
  octoprint/octoprint:latest || error "Failed to run OctoPrint docker container!"
