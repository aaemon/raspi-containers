#!/bin/bash

read -p "Time Zone: " tz
read -p "Username: " username
read -p "Password: " password
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/cloud9:latest || error "Failed to pull Cloud9 docker image!"

sudo docker run -d \
  --name=cloud9 \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e GITURL=https://github.com/linuxserver/docker-cloud9.git `#optional` \
  -e USERNAME=${username} \
  -e PASSWORD=${password} \
  -p 8000:8000 \
  -v /path/to/your/code:/code `#optional` \
  -v /var/run/docker.sock:/var/run/docker.sock `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/cloud9:latest || error "Failed to run Cloud9 docker container!"