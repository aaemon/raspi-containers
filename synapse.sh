#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull matrixdotorg/synapse:latest || error "Failed to pull Synapse docker image!"

sudo docker run -it --rm \
  --name=synapse \
  -v /portainer/Files/AppData/Config/synapse:/data \
  -e SYNAPSE_SERVER_NAME=matrix.dotscale.tk \
  -e SYNAPSE_REPORT_STATS=yes \
  -p 8008:8008 \
  -e UID=1000 \
  -e GID=1000 \
  --network=cloudflare \
  matrixdotorg/synapse:latest generate || error "Failed to run Synapse docker container!"