sudo su -

# Install docker
curl -fsSL https://get.docker.com | sh

# Configure docker group
groupadd docker
usermod -aG docker $USER
newgrp docker
docker version