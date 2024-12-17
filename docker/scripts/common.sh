#! /bin/bash

# sudo su -

sudo apt update
sudo apt upgrade -y

# Install docker
curl -fsSL https://get.docker.com | sh

# Configure docker group
sudo groupadd docker
sudo usermod -aG docker $USER
sudo newgrp docker
exit
sudo docker version

# Install Docker Compose
 sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 sudo chmod +x /usr/local/bin/docker-compose
 sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
 docker-compose --version