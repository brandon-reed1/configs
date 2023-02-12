#!/bin/bash
##  Author: https://github.com/trevor256
##  Usage: run on Ubuntu
##  make a usb 
##  sudo dd bs=4M if=Downloads/ubuntu.iso of=/dev/sd<?> conv=fdatasync status=progress 

# Adds green to echos
    GREEN="$(tput setaf 2)"
    NONE="$(tput sgr0)"

proxynet
Load Balancer aws




sudo apt update && sudo apt upgrade -y
sudo apt-get install nginx

sudo openssl genrsa -out /etc/ssl/private/private.key 2048

Server Block File
/etc/nginx
nginx -s reload                                       
server {
        listen 80;
        listen [::]:80;

        root /var/www/trevor256.com/public/;
        index index.html;

        server_name trevor256.com www.trevor256.com;

        location / {
                try_files $uri $uri/ =404;
        }
}

Using HTTPS with CloudFront
