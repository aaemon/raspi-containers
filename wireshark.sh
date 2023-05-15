#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/wireshark:latest || error "Failed to pull Wireshark docker image!"

sudo docker run -d \
  --name=wireshark \
  --net=host \
  --cap-add=NET_ADMIN \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 3002:3000 \
  -v /portainer/Failes/AppData/Config/Wireshark:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/wireshark:latest || error "Failed to run Wireshark docker container!"