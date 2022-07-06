#!/bin/bash

read -p "Time Zone: " tz
read -p "Sub Domains [Use comma(,) to separate]: " subdomains
read -p "Token: " token
echo "Waiting to pull the latest image..."

sudo docker pull lscr.io/linuxserver/duckdns:latest || error "Failed to pull DuckDNS docker image!"

sudo docker run -d \
  --name=duckdns \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e SUBDOMAINS=${subdomains} \
  -e TOKEN=${token} \
  -e LOG_FILE=false \
  -v /portainer/Files/AppData/Config/duckdns:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/duckdns:latest || error "Failed to run DuckDNS docker container!"