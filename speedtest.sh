#!/bin/bash

echo "Waiting to pull the latest image..."

sudo docker pull henrywhitaker3/speedtest-tracker:latest || error "Failed to pull Speedtest docker image!"

sudo docker run -d \
    --name=speedtest \
    -p 8765:80 \
    -v /portainer/Files/AppData/Config/speedtest:/config \
    -e OOKLA_EULA_GDPR=true \
    --restart unless-stopped \
    henrywhitaker3/speedtest-tracker:latest || error "Failed to run Speedtest docker container!"