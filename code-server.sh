#!/bin/bash

read -p "Time Zone: " tz
read -p "Password: " password
read -p "Sudo Password: " sudo_password
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/code-server:latest || error "Failed to pull CodeServer docker image!"

sudo docker run -d \
  --name=code-server \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e PASSWORD=${password} \
  -e SUDO_PASSWORD=${sudo_password} \
  -e HASHED_PASSWORD= `#optional` \
  -e SUDO_PASSWORD_HASH= `#optional` \
  -e PROXY_DOMAIN=code-server.my.domain `#optional` \
  -e DEFAULT_WORKSPACE=/config/workspace `#optional` \
  -p 8443:8443 \
  -v /portainer/Files/AppData/Config/CodeServer:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/code-server:latest || error "Failed to run CodeServer docker image!"