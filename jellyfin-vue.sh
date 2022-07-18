#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull jellyfin/jellyfin-vue:unstable || error "Failed to pull JellyfinVue docker image!"

sudo docker run -d \
    --name=jellyfin-vue \
    -p 9096:80/tcp \
    -e DEFAULT_SERVER=http://192.168.31.48:8096/ \
    --restart unless-stopped \
    jellyfin/jellyfin-vue:unstable || error "Failed to run JellyfinVue docker container!"