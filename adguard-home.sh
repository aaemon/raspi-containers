#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull adguard/adguardhome:latest || error "Failed to pull AdGuardHome docker image!"

sudo docker run -d \
    --name adguardhome \
    --restart unless-stopped \
    -v /portainer/Files/AppData/Config/adguardhome/work:/opt/AdguardHome/work \
    -v /portainer/Files/AppData/Config/adguardhome/conf:/opt/AdguardHome/conf \
    -p 53:53/tcp -p 53:53/udp \
    -p 67:67/udp -p 68:68/udp \
    -p 80:80/tcp -p 443:443/tcp -p 443:443/udp -p 3000:3000/tcp \
    -p 853:853/tcp \
    -p 784:784/udp -p 853:853/udp -p 8853:8853/udp \
    -p 5443:5443/tcp -p 5443:5443/udp \
    -d adguard/adguardhome:latest || error "Failed to run AdGuardHome docker container!"