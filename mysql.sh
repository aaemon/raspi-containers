#!/bin/bash

read -s -p "Enter MySQL Root Password: " pswd
echo ""
echo "Waiting to pull the latest image..."

sudo docker pull mysql:8.0.29-oracle || error "Failed to pull MySQL docker image!"

sudo docker run -d \
  --name mysql \
  -p 3306:3306 \
  -v /var/lib/mysql:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=${pswd} \
  --restart unless-stopped \
  mysql:8.0.29-oracle || error "Failed to run MySQL docker container!"