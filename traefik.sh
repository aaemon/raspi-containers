#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull traefik:latest || error "Failed to pull Traefik docker image!"

sudo docker run -d \
    --name traefik \
    -p 8080:8080 \
    -p 80:80 \
    -v /portainer/Files/AppData/Config/Traefik/traefik.yml:/etc/traefik/traefik.yml \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -- restart=unless-stopped \
    traefik:latest || error "Failed to run Traefik docker image!"

