#!/bin/bash
###################################################################
#  Author https://github.com/trevor256
#  script configs new home server
#  Linux OS (Debian)
#
#  Applications
#  docker, penpot, jellyfin, nextcloud,
###################################################################

sudo apt update && sudo apt upgrade -y
curl -fsSL get.docker.com | sudo sh

#penpot 
wget https://raw.githubusercontent.com/penpot/penpot/main/docker/images/docker-compose.yaml
sudo docker compose -p penpot -f docker-compose.yaml up -d

wget #jellyfin.yaml
sudo docker compose -p jellyfin -f jellyfin.yaml up -d

#nextcloud