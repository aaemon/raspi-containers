#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull httpd:latest || error "Failed to pull Httpd docker image!"

sudo docker run -d \ 
    --name httpd \
    -p 80:80 \
    -p 443:443 \
    -v /portainer/Files/AppData/Config/httpd:/usr/local/apache2/htdocs/ \
    -- restart=unless-stopped \
    httpd:latest || error "Failed to run Httpd docker image!"

