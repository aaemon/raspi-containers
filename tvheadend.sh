#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/tvheadend:latest || error "Failed to pull TVHeadEnd docker image!"

sudo docker run -d \
    --name=tvheadend \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=${tz} \
    -e RUN_OPTS=<run options here> `#optional` \
    -p 9981:9981 \
    -p 9982:9982 \
    -v /portainer/Files/AppData/Config/tvheadend/config:/config \
    -v /portainer/Files/AppData/Config/tvheadend/recordings:/recordings \
    --device /dev/dri:/dev/dri `#optional` \
    --device /dev/dvb:/dev/dvb `#optional` \
    --restart unless-stopped \
    lscr.io/linuxserver/tvheadend:latest || error "Failed to run TVHeadEnd docker container!"