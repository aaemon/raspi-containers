#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull ghcr.io/ajnart/homarr:latest || error "Failed to pull Homarr docker image!"

docker run  \
  --name homarr \
  --restart unless-stopped \
  -p 7575:7575 \
  -v /portainer/Files/AppData/Config/homarr/configs:/app/data/configs \
  -v /portainer/Files/AppData/Config/homarr/icons:/app/public/icons \
  -d ghcr.io/ajnart/homarr:latest || error "Failed to run Homarr docker container!"