#!/bin/bash

docker run -d \
  --name mysql \
  -p 3306:3306 \
  -v /var/lib/mysql:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=root@1234 \
  --restart unless-stopped \
  mysql:8.0.29-oracle