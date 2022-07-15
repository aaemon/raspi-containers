#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull adminer:latest || error "Failed to pull phpAdminer docker image!"

docker run -d \
  --name phpadminer \
  --link mariadb:db \
  -p 3090:8080 \
  adminer:latest || error "Failed to run phpAdminer docker image!"