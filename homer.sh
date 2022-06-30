#!/bin/bash

docker run -d \
  --name=homer \
  -p 8902:8080 \
  -v /portainer/Files/AppData/Config/homer:/www/assets \
  -e INIT_ASSETS=0 \ #there is a bug, so you will have to manually import the assets
  --restart unless-stopped \
  b4bz/homer:latest