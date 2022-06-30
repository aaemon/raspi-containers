#!/bin/bash

docker run -d \
    --name watchtower \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --restart unless-stopped \
    containrrr/watchtower