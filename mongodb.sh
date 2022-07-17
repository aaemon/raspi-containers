#!/bin/bash

read -p "Time Zone: " tz
read -p "Enter MongoDB Root Username: " username 
read -p "Enter MongoDB Root Password: " password 
echo "Waiting to pull the latest image..."

sudo docker pull mongo:latest || error "Failed to pull MongoDB docker image!"

sudo docker run -d \
  --name mongodb \
  -v /var/lib/mongodb:/etc/mongo \
  -e TZ=${tz} \
  -e MONGO_INITDB_ROOT_USERNAME=${username} \
  -e MONGO_INITDB_ROOT_PASSWORD=${password} \
  --restart unless-stopped \
  mongo:latest || error "Failed to run MongoDB docker container!"


sudo docker pull mongo:latest || error "Failed to pull MongoDB_Express docker image!"

sudo docker run -d \
  --name mongo-express \
  -p 8081:8081 \
  -v /var/lib/mongodb:/etc/mongo \
  -e TZ=${tz} \
  -e ME_CONFIG_MONGODB_ADMINUSERNAME=${username} \
  -e ME_CONFIG_MONGODB_ADMINPASSWORD=${password} \
  -e ME_CONFIG_MONGODB_URL: mongodb://${username}:${password}@mongo:27017/
  --restart unless-stopped \
  mongo-express:latest || error "Failed to run MongoDB_Express docker container!"