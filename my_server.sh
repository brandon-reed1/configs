#!/bin/bash
###################################################################
#  Author https://github.com/trevor256
#  script configs new home server
#  Linux OS (Debian)
#
#  Applications
#  Docker, jellyfin, firewall, torrent
###################################################################

#updates
# systemd-analyze blame
grep -rl GRUB_TIMEOUT=5 /etc/default/grub | xargs sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' && update-grub2 #set grub timeout to 0 saves 10sec on boot
apt install -y curl software-properties-common
apt-add-repository non-free 
apt-add-repository contrib
apt update && apt upgrade -y

#nvidia Driver
apt install -y curl nvidia-driver 

#docker
curl -fsSL get.docker.com | sudo sh

#mount drives
mkdir /drive/media1 /drive/media2 /drive/media3
mount /dev/sdb /drive/media2
mount /dev/sdc /drive/media1
mount /dev/sdd /drive/media3
echo "UUID=d343b798-b1e2-46fd-8900-170dd704429d /drive/media1 ext4 defaults 0 0" >> /etc/fstab
echo "UUID=f6ed0000-828b-4ba2-af1e-e7e46c8652d5 /drive/media2 ext4 defaults 0 0" >> /etc/fstab
echo "UUID=aef2f629-845d-4c98-9270-6bf907f07c86 /drive/media3 ext4 defaults 0 0" >> /etc/fstab

#nvidia container tool
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

#penpot 
wget https://raw.githubusercontent.com/trevor256/myconfigs/main/docker/penpot.yaml
sudo docker compose -p penpot -f penpot.yaml up -d

#jellyfin
wget https://raw.githubusercontent.com/trevor256/myconfigs/main/docker/jellyfin.yaml
sudo docker compose -p jellyfin -f jellyfin.yaml up -d

#nextcloud
