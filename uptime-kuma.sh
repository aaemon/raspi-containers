#!/bin/bash

docker run -d \
  --name uptime-kuma \
  -p 3001:3001 \
  -v /portainer/Files/AppData/Config/uptime-kuma:/app/data \
  --restart unless-stopped \
  louislam/uptime-kuma:1