#!/bin/bash

sudo docker pull emby/embyserver:latest || error "Failed to pull the latest Emby docker image!"

docker run -d \
    --name embyserver \
    -v /portainer/Files/AppData/Config/embyserver:/config \ # Configuration directory
    -v /media/nfs/tvshows-english:/data/tvshows-english \
    -v /media/nfs/movies-english:/data/movies-english \
    -v /media/nfs/movies-hindi:/data/movies-hindi \
    -v /media/nfs/movies-bangla:/data/movies-bangla \
    -v /media/nfs/animations-english:/data/animations-english \
    --device /dev/dri:/dev/dri \ # VAAPI/NVDEC/NVENC render nodes
    --device /dev/vchiq:/dev/vchiq \ # MMAL/OMX on Raspberry Pi
    --runtime=nvidia \ # Expose NVIDIA GPUs
    --publish 8096:8096 \ # HTTP port
    --publish 8920:8920 \ # HTTPS port
    --env UID=1000 \ # The UID to run emby as (default: 2)
    --env GID=1000 \ # The GID to run emby as (default 2)
    --restart unless-stopped \
    emby/embyserver:latest || error "Failed to run Emby docker image!"