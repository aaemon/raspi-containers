#!/bin/bash

docker run -d \
    --name=jellyfin-vue \
    -p 9096:80/tcp \
    -e DEFAULT_SERVER=http://192.168.31.48:8096/ \
      --restart unless-stopped \
    jellyfin/jellyfin-vue:unstable