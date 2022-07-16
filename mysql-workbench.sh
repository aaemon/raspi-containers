#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/mysql-workbench:latest || error "Failed to pull MySQL-Workbench docker image!"

sudo docker run -d \
  --name=mysql-workbench \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -p 3030:3000 \
  -v /portainer/Files/AppData/Config/MySQL-Workbench:/config \
  --cap-add="IPC_LOCK" \
  --restart unless-stopped \
  lscr.io/linuxserver/mysql-workbench:latest || error "Failed to run MySQL-Workbench docker container!"