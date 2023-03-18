#!/bin/bash

read -p "Server Name: " serverName
echo "Waiting to pull the latest image..."

sudo docker pull matrixdotorg/synapse:latest || error "Failed to pull Synapse docker image!"

sudo docker run -it --rm \
  --name=synapse \
  -v /portainer/Files/AppData/Config/synapse:/data \
  -e SYNAPSE_SERVER_NAME=${serverName} \
  -e SYNAPSE_REPORT_STATS=yes \
  -p 8008:8008 \
  -e UID=1000 \
  -e GID=1000 \
  --network=cloudflare \
  matrixdotorg/synapse:latest generate || error "Failed to run Synapse docker container!"
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  sudo docker run -it --rm \
  -v /portainer/Files/AppData/Config/synapse:/data \
  -e SYNAPSE_SERVER_NAME=matrix.dotscale.tech \
  -e SYNAPSE_REPORT_STATS=yes \
  -e UID=1000 \
  -e GID=1000 \
  matrixdotorg/synapse:latest generate

# Add the following lines to homeserver.yml
------------------------------------------------------
database:
    name: psycopg2
    args:
        user: synapse
        password: somepassword
        host: postgresql
        database: synapse
        cp_min: 5
        cp_max: 10
------------------------------------------------------
# add postgres user

createuser --pwprompt synapse_user

createdb --encoding=UTF8 --locale=C --template=template0 --owner=synapse_user synapse

======================================================

docker run -d --name synapse \
    -e UID=1000 \
    -e GID=1000 \
    -v /portainer/Files/AppData/Config/synapse:/data \
    -p 8008:8008 \
    matrixdotorg/synapse:latest



# to generate account

docker exec -it synapse register_new_matrix_user http://localhost:8008 -c /data/homeserver.yaml
