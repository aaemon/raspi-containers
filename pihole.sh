#!/bin/bash

read -p "Time Zone: " tz
read -p "WEB Password: " password
echo "Waiting to pull the latest image..."

sudo docker pull pihole/pihole:latest || error "Failed to pull PiHole docker image!"

sudo docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 1010:80 \
    -e TZ=${tz} \
    -e WEBPASSWORD=${password} \
    -v "/portainer/Files/AppData/Config/PiHole/etc-pihole:/etc/pihole" \
    -v "/portainer/Files/AppData/Config/PiHole/etc-dnsmasq.d:/etc/dnsmasq.d" \
    --restart=unless-stopped \
    --hostname pi.hole \
    --cap-add NET_ADMIN \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e ServerIP="127.0.0.1" \
    --restart unless-stopped \
    pihole/pihole:latest || error "Failed to run PiHole docker container!"