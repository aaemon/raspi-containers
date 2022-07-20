#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull lissy93/dashy:latest || error "Failed to pull Dashy docker image!"

sudo docker run -d \
  --name dashy \
  -p 4000:80 \
  -v /portainer/Files/AppData/Config/Dashy/my-local-conf.yml:/app/public/conf.yml \
  --restart=always \
  lissy93/dashy:latest || error "Failed to run Dashy docker container!"