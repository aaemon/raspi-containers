#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull jlesage/nginx-proxy-manager:latest || error "Failed to pull Nginx-Proxy-Manager docker image!"

sudo docker run -d \
    --name=nginx-proxy-manager \
    -p 80:80 \
    -p 81:81 \
    -p 443:443 \
    -v /portainer/Files/AppData/Config/nginx-proxy-manager/data:/data
    -v /portainer/Files/AppData/Config/nginx-proxy-manager/letsencrypt:/etc/letsencrypt
    --restart unless-stopped \
    jc21/nginx-proxy-manager:latest || error "Failed to run Nginx-Proxy-Manager docker container!"