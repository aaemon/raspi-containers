#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull matrixdotorg/synapse:latest || error "Failed to pull Synapse-Admin docker image!"

sudo docker run -d \
  --name=synapse-admin \
  -p 8082:80 \
  --network=cloudflare \
  --restart=unless-stopped \
  awesometechnologies/synapse-admin:latest || error "Failed to run Synapse-Admin docker container!"