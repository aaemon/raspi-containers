#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull containrrr/watchtower || error "Failed to pull WatchTower docker image!"

sudo docker run -d \
    --name watchtower \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --restart unless-stopped \
    containrrr/watchtower || error "Failed to run WatchTower docker container!"