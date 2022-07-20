#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull jokobsk/pi.alert:latest || error "Failed to pull PiAlert docker image!"

sudo docker run -d \
  --name pialert \
  -p 20211:20211 \
  -e TZ=$tz \
  -e HOST_USER_ID=1000 \
  -e HOST_GROUP_ID=1000 \
  -v /portainer/Files/AppData/Config/PiAlert/config:/home/pi/pialert/config \
  -v /portainer/Files/AppData/Config/PiAlert/db/pialert.db:/home/pi/pialert/db/pialert.db \
  -v /portainer/Files/AppData/Config/PiAlert/log.db:/home/pi/pialert/log \
  --network host \
  --restart=always \
  jokobsk/pi.alert:latest || error "Failed to run PiAlert docker container!"