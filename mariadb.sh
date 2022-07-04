#!/bin/bash

read -s -p "Enter MariaDB Root Password: " pswd
echo ""
echo "Waiting to pull the latest image..."

sudo docker pull mariadb:latest || error "Failed to pull MariaDB docker image!"

sudo docker run -d \
  --name mariadb \
  -p 3808:3306 \
  -v /var/lib/mariadb:/var/lib/mysql \
  -e MARIADB_ROOT_PASSWORD=${pswd} \
  --restart unless-stopped \
  mariadb:latest || error "Failed to run MariaDB docker container!"