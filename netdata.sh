#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull netdata/netdata:latest || error "Failed to pull NetData docker image!"

sudo docker run -d --name=netdata \
  -p 19999:19999 \
  -v /portainer/Files/AppData/Config/Netdata/netdataconfig:/etc/netdata \
  -v /portainer/Files/AppData/Config/Netdata/netdatalib:/var/lib/netdata \
  -v /portainer/Files/AppData/Config/Netdata/netdatacache:/var/cache/netdata \
  -v /etc/passwd:/host/etc/passwd:ro \
  -v /etc/group:/host/etc/group:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /etc/os-release:/host/etc/os-release:ro \
  --restart unless-stopped \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  netdata/netdata:latest || error "Failed to run NetData docker container!"