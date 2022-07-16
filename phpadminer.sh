#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull adminer:latest || error "Failed to pull phpAdminer docker image!"

sudo docker run -d \
  --name phpadminer \
  --link mysql:db \
  -p 3090:8080 \
  adminer:latest || error "Failed to run phpAdminer docker image!"