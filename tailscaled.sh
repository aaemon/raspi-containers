#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull tailscale/tailscale || error "Failed to pull Tailscale docker image!"

sudo docker run -d \
  --name=tailscaled \
  -v /var/lib:/var/lib \
  -v /dev/net/tun:/dev/net/tun \
  --network=host \
  --privileged \
  --restart unless-stopped \
  tailscale/tailscale tailscaled || error "Failed to run Tailscale docker container!"


sudo docker exec tailscaled tailscale up