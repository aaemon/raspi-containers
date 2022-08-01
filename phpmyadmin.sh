#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull phpmyadmin:latest || error "Failed to pull phpMyAdmin docker image!"

sudo docker run -d \
  --name phpmyadmin \
  --link mysql:db \
  -p 3080:80 \
  --restart unless-stopped \
  phpmyadmin:latest || error "Failed to run phpMyAdmin docker image!"