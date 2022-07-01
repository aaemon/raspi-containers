#!/bin/bash

sudo docker pull tailscale/tailscale || error "Failed to pull the latest Tailscale docker image!"

sudo docker run -d \
  --name=tailscaled \
  -v /var/lib:/var/lib \
  -v /dev/net/tun:/dev/net/tun \
  --network=host --privileged \
  --restart unless-stopped \
  tailscale/tailscale tailscaled || error "Failed to run Tailscale docker image!"

## you will have to enter following command after you run this script:

sudo docker exec tailscaled tailscale up