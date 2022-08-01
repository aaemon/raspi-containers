#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull ghcr.io/ajnart/homarr:latest || error "Failed to pull Homarr docker image!"

sudo docker run  -d \
  --name homarr \
  -p 7575:7575 \
  -v /portainer/Files/AppData/Config/Homarr/configs:/app/data/configs \
  -v /portainer/Files/AppData/Config/Homarr/icons:/app/public/icons \
  --restart unless-stopped \
  ghcr.io/ajnart/homarr:latest || error "Failed to run Homarr docker container!"