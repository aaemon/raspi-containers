#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull selfhostedpro/yacht:latest || error "Failed to pull Yacht docker image!"

docker volume create yacht

docker run -d \
    -p 8000:8000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v yacht:/config \
    --name yacht \
    --restart unless-stopped \
    selfhostedpro/yacht:latest || error "Failed to run Yacht docker container!"