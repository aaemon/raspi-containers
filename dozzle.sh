#!/bin/bash

docker run -d \
  --name=dozzle \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --restart unless-stopped \
  -p 8080:8080 amir20/dozzle:latest