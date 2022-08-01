#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull mvance/unbound:latest || error "Failed to pull Unbound docker image!"

sudo docker -d run \
  --name unbound \
  -p 53:53/udp \
  -p 53:53/tcp \
  --restart unless-stopped \
  mvance/unbound:latest || error "Failed to run Unbound docker container!"