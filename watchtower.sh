#!/bin/bash

sudo docker pull containrrr/watchtower || error "Failed to pull the latest WatchTower docker image!"

sudo docker run -d \
    --name watchtower \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --restart unless-stopped \
    containrrr/watchtower || error "Failed to run WatchTower docker image!"