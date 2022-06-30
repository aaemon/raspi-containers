#!/bin/bash

docker run -d \
    --name=speedtest \
    -p 8765:80 \
    -v /path/to/data:/config \
    -e OOKLA_EULA_GDPR=true \
    --restart unless-stopped \
    henrywhitaker3/speedtest-tracker