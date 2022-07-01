#!/bin/bash

sudo docker pull louislam/uptime-kuma:1 || error "Failed to pull the latest UptimeKuma docker image!"

sudo docker run -d \
  --name uptime-kuma \
  -p 3001:3001 \
  -v /portainer/Files/AppData/Config/uptime-kuma:/app/data \
  --restart unless-stopped \
  louislam/uptime-kuma:1 || error "Failed to run UptimeKuma docker image!"