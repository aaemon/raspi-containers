#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/airsonic || error "Failed to pull Airsonic docker image!"

sudo docker run -d \
  --name=airsonic \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e CONTEXT_PATH=<URL_BASE> `#optional` \
  -e JAVA_OPTS=<options> `#optional` \
  -p 4040:4040 \
  -v /portainer/Files/AppData/Config/Airsonic:/config \
  -v /media/nfs/music:/music \
  -v /media/nfs/playlists:/playlists \
  -v /media/nfs/podcasts:/podcasts \
  -v /media/nfs/media:/media `#optional` \
  --device /dev/snd:/dev/snd `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/airsonic || error "Failed to run Airsonic docker container!"