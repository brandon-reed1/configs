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

usermod –aG sudo trevor

echo "${GREEN}Updating${NC}" #updates
apt install software-properties-common
apt-add-repository non-free 
apt-add-repository contrib
apt update && apt upgrade -y

echo "${GREEN}mount drives ${NC}" #mount drives
mkdir cache
mkdir config
mkdir share
mount /dev/sdb /share/drive1
mount /dev/sdc /share/drive2
mount /dev/sdd /share/drive3

echo "UUID=f6ed0000-828b-4ba2-af1e-e7e46c8652d5 /share/drive2 ext4 defaults 0 0" >> /etc/fstab
echo "UUID=d343b798-b1e2-46fd-8900-170dd704429d /share/drive1 ext4 defaults 0 0" >> /etc/fstab
echo "UUID=aef2f629-845d-4c98-9270-6bf907f07c86 /share/drive3 ext4 defaults 0 0" >> /etc/fstab

#change download location and stop once done
apt install -y ffmpeg transmission-cli #transmission-cli "" -w /share/?   kill -p -9

echo "${GREEN}installing podman${NC}" #podman
apt install -y podman

echo "${GREEN}install and run jellypodman${NC}" #jellyfin podman #run as non root user 
podman run \
 --detach \
 --label "io.containers.autoupdate=registry" \
 --name myjellyfin \
 --publish 8096:8096/tcp \
 --rm \
 --user $(id -u):$(id -g) \
 --userns keep-id \
 --volume jellyfin-cache:/cache:Z \
 --volume jellyfin-config:/config:Z \
 --mount type=bind,source=/share,destination=/media,ro=true \
 docker.io/jellyfin/jellyfin:latest

#podman generate systemd
podman generate systemd --new --name myjellyfin > /etc/systemd/system/container-myjellyfin.service
podman stop myjellyfin
systemctl --user enable --now container-myjellyfin.service
loginctl enable-linger $USER
systemctl --user enable --now podman-auto-update.timer

#nvidia Driver
apt install -y nvidia-driver 