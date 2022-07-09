#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull hurlenko/filebrowser:latest || error "Failed to pull FileBrowser docker image!"

sudo docker run -d \
    --name filebrowser \
    --user $(id -u):$(id -g) \
    -p 8080:8080 \
    -v /DATA_DIR:/data \
    -v /portainer/Files/AppData/Config/FileBrowser:/config \
    -e FB_BASEURL=/filebrowser \
    hurlenko/filebrowser:latest || error "Failed to run FileBrowser docker container!"