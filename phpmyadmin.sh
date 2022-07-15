#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull phpmyadmin:latest || error "Failed to pull phpMyAdmin docker image!"

docker run -d \
  --name phpmyadmin \
  --link mariadb:db \
  -p 3080:80 \
  phpmyadmin:latest || error "Failed to run phpMyAdmin docker image!"