#!/bin/bash
###################################################################
#  Author https://github.com/trevor256
#  script configs new home server
#  Linux OS (Debian)
#
#  Applications
#  Docker, Tansmission, Penpot, Nextcloud, Penpot, nginx-proxy-manager
###################################################################

#updates 
# check boot times with: systemd-analyze blame
sudo apt update && apt upgrade -y
grep -rl GRUB_TIMEOUT=5 /etc/default/grub | xargs sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' && update-grub2 #set grub timeout to 0 saves 10sec on boot
sudo apt install -y software-properties-common
sudo apt-add-repository non-free && sudo apt-add-repository contrib
sudo apt update && sudo apt upgrade -y

#software install
sudo apt install -y curl transmission-cli transmission-common transmission-daemon nginx

#Mount Drives
mkdir drive/media3/UserAdded /drive/media1 /drive/media2 /drive/media3
mount /dev/sdb /drive/media2
mount /dev/sdc /drive/media1
mount /dev/sdd /drive/media3
echo "UUID=d343b798-b1e2-46fd-8900-170dd704429d /drive/media1 ext4 defaults 0 0" >> /etc/fstab
echo "UUID=f6ed0000-828b-4ba2-af1e-e7e46c8652d5 /drive/media2 ext4 defaults 0 0" >> /etc/fstab
echo "UUID=aef2f629-845d-4c98-9270-6bf907f07c86 /drive/media3 ext4 defaults 0 0" >> /etc/fstab

#Docker install
curl -fsSL get.docker.com | sudo sh

# Tansmission 
sudo systemctl stop transmission-daemon
sudo grep -rl '"rpc-whitelist-enabled": true,' /var/lib/transmission-daemon/info/settings.json | sudo xargs sed -i 's/"rpc-whitelist-enabled": true,/"rpc-whitelist-enabled": false,/g'
sudo grep -rl /var/lib/transmission-daemon/info/settings.json | sudo xargs sed -i  's/\/var\/lib\/transmission-daemon\/drive\/media3\/UserAdded\/g'
sudo systemctl start transmission-daemon

# Nvidia
apt install nvidia-cuda-toolkit nvidia-driver

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


#Penpot 
#wget https://raw.githubusercontent.com/trevor256/myconfigs/main/docker/penpot.yaml
#sudo docker compose -p penpot -f penpot.yaml up -d

#Jellyfin
wget https://raw.githubusercontent.com/trevor256/myconfigs/main/docker/jellyfin.yaml
sudo docker compose -p jellyfin -f jellyfin.yaml up -d

#Nextcloud
wget 
sudo docker compose -p nextcloud -f nextcloud.yaml up -d

#nginx-proxy-manager
wget https://raw.githubusercontent.com/trevor256/myconfigs/main/docker/nginx-proxy-manager.yaml
docker compose up -d #fix this to 
#Email:    admin@example.com
#Password: changeme
#http://192.168.1.16:8001/


#ffmpeg with nvidia 
mkdir ~/nvidia/ && cd ~/nvidia/
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
cd nv-codec-headers && sudo make install
cd ~/nvidia/
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg/
sudo apt install build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev
cd ~/nvidia/ffmpeg/
make -j $(nproc)
ls -l ffmpeg
./ffmpeg

