#!/bin/bash

read -p "Enter MariaDB Root Password: " password
echo "Waiting to pull the latest image..."

sudo docker pull mariadb:latest || error "Failed to pull MariaDB docker image!"

sudo docker run -d \
  --name mariadb \
  -p 3306:3306 \
  -v /var/lib/mariadb:/var/lib/mysql \
  -e MARIADB_ROOT_PASSWORD=${password} \
  --restart unless-stopped \
  mariadb:latest || error "Failed to run MariaDB docker container!"