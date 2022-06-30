#!/bin/bash

read -s -p "Enter MySQL Root Password: " pswd  

docker run -d \
  --name mysql \
  -p 3306:3306 \
  -v /var/lib/mysql:/var/lib/mysql \
  -e "MYSQL_ROOT_PASSWORD=${pswd}" \
  --restart unless-stopped \
  mysql:8.0.29-oracle