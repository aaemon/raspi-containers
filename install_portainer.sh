#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull portainer/portainer-ce:latest || error "Failed to pull Portainer docker image!"

sudo docker run -d \
  --name=portainer \
  -p 9000:9000 \
  -p 9443:9443 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  --restart=always \
  portainer/portainer-ce:latest || error "Failed to run Portainer docker container!"
