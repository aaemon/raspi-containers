#!/bin/bash

read -p "Time Zone: " tz
echo "Waiting to pull the latest image..."

sudo docker pull linuxserver/letsencrypt:latest || error "Failed to pull Let's_Encrypt docker image!"


sudo docker run -d \
  --name=letsencrypt \
  --cap-add=NET_ADMIN \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=${tz} \
  -e URL=yourdomain.url \
  -e SUBDOMAINS=www, \
  -e VALIDATION=http \
  -e CERTPROVIDER= `#optional` \
  -e DNSPLUGIN=cloudflare `#optional` \
  -e DUCKDNSTOKEN=<token> `#optional` \
  -e EMAIL=<e-mail> `#optional` \
  -e ONLY_SUBDOMAINS=false `#optional` \
  -e EXTRA_DOMAINS=<extradomains> `#optional` \
  -e STAGING=false `#optional` \
  -p 443:443 \
  -p 80:80 `#optional` \
  -v /portainer/Files/AppData/Config/LetsEncryt:/config \
  --restart unless-stopped \
  linuxserver/letsencrypt:latest || error "Failed to run Let's_Encrypt docker container!"