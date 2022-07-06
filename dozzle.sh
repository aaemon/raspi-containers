#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull amir20/dozzle:latest || error "Failed to pull Dozzle docker image!"

sudo docker run -d \
  --name=dozzle \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --restart unless-stopped \
  -p 8080:8080 \
  amir20/dozzle:latest || error "Failed to run Dozzle docker container!"