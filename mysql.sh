#!/bin/bash

read -s "Enter MySQL Root Password: " password
echo "Waiting to pull the latest image..."

sudo docker pull mysql:latest || error "Failed to pull MySQL docker image!"

sudo docker run -d \
  --name mysql \
  -p 3306:3306 \
  -v /var/lib/mysql:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=${password} \
  --restart unless-stopped \
  mysql:latest || error "Failed to run MySQL docker container!"