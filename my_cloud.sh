#!/bin/bash
###################################################################
#  Author https://github.com/trevor256
#  script configs new home server
#  Linux OS (Debian)
#
#  Applications
#   Penpot, nextcloud
###################################################################


sudo apt update && sudo apt upgrade -y
curl -fsSL get.docker.com | sudo sh

#penpot 
wget https://raw.githubusercontent.com/penpot/penpot/main/docker/images/docker-compose.yaml
sudo docker compose -p penpot -f docker-compose.yaml up -d

#nextcloud
sudo docker run \
--sig-proxy=false \
--name nextcloud-aio-mastercontainer \
--restart always \
--publish 80:80 \
--publish 8080:8080 \
--publish 8443:8443 \
--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
--volume /var/run/docker.sock:/var/run/docker.sock:ro \
nextcloud/all-in-one:latest

proofs monoxide opossum zoology joylessly ablaze wing distress