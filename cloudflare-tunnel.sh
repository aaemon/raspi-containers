#!/bin/bash

read -p "Cloudflare Token: " token

sudo docker pull cloudflare/cloudflared:latest || error "Failed to pull Cloudflare Tunnel docker image!"
echo "Waiting to pull the latest image..."

sudo docker run  -d \
  --name cloudflare \
  -e TUNNEL_TOKEN=${token} \
  --restart unless-stopped \
  cloudflare/cloudflared:latest || error "Failed to run Cloudflare Tunnel docker container!"