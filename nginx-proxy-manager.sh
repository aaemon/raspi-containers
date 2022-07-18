#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull jlesage/nginx-proxy-manager:latest || error "Failed to pull Nginx-Proxy-Manager docker image!"

sudo docker run -d \
    --name=nginx-proxy-manager \
    -p 8181:8181 \
    -p 8080:8080 \
    -p 4443:4443 \
    -v /docker/appdata/Nginx-Proxy-Manager:/config:rw \
    --restart unless-stopped \
    jlesage/nginx-proxy-manager:latest || error "Failed to run Nginx-Proxy-Manager docker container!"