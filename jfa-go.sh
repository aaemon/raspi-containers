#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull hrfee/jfa-go:latest || error "Failed to pull Jfa-Go docker image!"

sudo docker run -d \
    --name "jfa-go" \
    -p 8056:8056 \
    # -p 8057:8057 if using tls \
    -v /portainer/Files/AppData/Config/jfa-go:/data \
    -v /portainer/Files/AppData/Config/jellyfin:/jf \
    -v /etc/localtime:/etc/localtime:ro \
    --restart unless-stopped \
    hrfee/jfa-go:latest || error "Failed to run Jfa-Go docker container!"
