#!/bin/bash
###################################################################
#  Author https://github.com/trevor256
#  script configs new home server
#  Linux OS (Debian)
#
#  Applications
#  PXE Server, torrent, podman, jellyfin, firewall, samba file share,
###################################################################

# Adds green to echos
GREEN="$(tput setaf 2)"
NONE="$(tput sgr0)"

echo "${GREEN}Starting${NC}" 
#updates
apt install software-properties-common
apt-add-repository non-free 
apt-add-repository contrib
apt install -y extrepo
extrepo enable jellyfin
apt update && apt upgrade -y

#mount drives
mkdir share
mount /dev/sdb /share/drive1
mount /dev/sdc /share/drive2
mount /dev/sdd /share/drive3

echo "UUID=f6ed0000-828b-4ba2-af1e-e7e46c8652d5 /share/drive1 ext4 defaults 0 0" >> /etc/fstab
echo "UUID=d343b798-b1e2-46fd-8900-170dd704429d /share/drive2 ext4 defaults 0 0" >> /etc/fstab
echo "UUID=aef2f629-845d-4c98-9270-6bf907f07c86 /share/drive3 ext4 defaults 0 0" >> /etc/fstab

#install ufw ffmpeg transmission-cli jellyfin nginx 
apt install -y ufw ffmpeg transmission-cli jellyfin jellyfin-ffmpeg nginx #transmission-cli "" -w /share/?   kill -p -9

sudo usermod -aG render jellyfin
sudo systemctl restart jellyfin

systemctl restart nginx

#nvidia Driver
apt install -y nvidia-driver 

echo "${GREEN}Done${NC}" 