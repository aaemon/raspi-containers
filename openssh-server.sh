#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/openssh-server:latest || error "Failed to pull OpenSSH-Server docker image!"

sudo docker run -d \
  --name=openssh-server \
  --hostname=openssh-server `#optional` \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e PUBLIC_KEY=yourpublickey `#optional` \
  -e PUBLIC_KEY_FILE=/path/to/file `#optional` \
  -e PUBLIC_KEY_DIR=/path/to/directory/containing/_only_/pubkeys `#optional` \
  -e PUBLIC_KEY_URL=https://github.com/username.keys `#optional` \
  -e SUDO_ACCESS=false `#optional` \
  -e PASSWORD_ACCESS=false `#optional` \
  -e USER_PASSWORD=password `#optional` \
  -e USER_PASSWORD_FILE=/path/to/file `#optional` \
  -e USER_NAME=linuxserver.io `#optional` \
  -p 2222:2222 \
  -v /portainer/Files/AppData/Config/OpenSSH-Server:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/openssh-server:latest || error "Failed to run OpenSSH-Server docker image!"