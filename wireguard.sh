#!/bin/bash

read -p "Password: " password
echo "Waiting to pull the latest image..."

sudo docker pull weejewel/wg-easy:latest || error "Failed to pull Wireguard docker image!"

sudo docker run -d \
  --name=wireguard \
  -e WG_HOST=192.168.31.48 \
  -e PASSWORD=${password} \
  -v /portainer/Files/AppData/Config/WireGuard:/etc/wireguard \
  -p 51820:51820/udp \
  -p 51821:51821/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv4.ip_forward=1" \
  --restart unless-stopped \
  weejewel/wg-easy:latest || error "Failed to run Wireguard docker image!"