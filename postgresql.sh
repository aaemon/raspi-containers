#!/bin/bash

read -p "Time Zone: " tz
read -p "Enter PostgreSQL Password: " password
echo "Waiting to pull the latest image..."

sudo docker pull postgres:latest || error "Failed to pull PostgreSQL docker image!"

sudo docker run -d \
  --name postgresql \
  -p 5432:5432 \
  -e TZ=${tz} \
  -e POSTGRES_PASSWORD=${password} \
  -v /var/lib/postgresql:/var/lib/postgresql/data \
  --restart unless-stopped \
  postgres:latest || error "Failed to run PostgreSQL docker container!"