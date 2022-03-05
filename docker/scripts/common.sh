#! /bin/bash

sudo su -

sudo apt update
sudo apt upgrade -y

# Install docker
curl -fsSL https://get.docker.com | sh

# Configure docker group
groupadd docker
usermod -aG docker $USER
newgrp docker
docker version