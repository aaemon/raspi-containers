#!/bin/bash

read -p "Enter pgAdmin Email: " email
read -p "Enter pgAdmin Password: " password
echo "Waiting to pull the latest image..."

sudo docker pull dpage/pgadmin4:latest || error "Failed to pull pgAdmin4 docker image!"

sudo docker run -d \
    --name pgadmin \
    -p 5050:80 \
    -e PGADMIN_DEFAULT_EMAIL=${email} \
    -e PGADMIN_DEFAULT_PASSWORD=${password} \
    --restart unless-stopped \
    dpage/pgadmin4:latest || error "Failed to run pgAdmin4 docker container!"
