#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull louislam/uptime-kuma:1 || error "Failed to pull UptimeKuma docker image!"

sudo docker run -d \
  --name uptime-kuma \
  -p 3001:3001 \
  -v /portainer/Files/AppData/Config/UptimeKuma:/app/data \
  --restart unless-stopped \
  louislam/uptime-kuma:1 || error "Failed to run UptimeKuma docker container!"