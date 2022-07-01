#!/bin/bash

sudo docker pull pihole/pihole:latest || error "Failed to pull the latest PiHole docker image!"

sudo docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 1010:80 \
    -e TZ="Asia/Dhaka" \
    -v "/portainer/Files/AppData/Config/pihole/etc-pihole:/etc/pihole" \
    -v "/portainer/Files/AppData/Config/pihole/etc-dnsmasq.d:/etc/dnsmasq.d" \
    --restart=unless-stopped \
    --hostname pi.hole \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e ServerIP="127.0.0.1" \
    --restart unless-stopped \
    pihole/pihole:latest || error "Failed to run PiHole docker image!"