sudo su -

# Install docker
curl -fsSL https://get.docker.com | sh

# Configure docker group
groupadd docker
usermod -aG docker $USER
newgrp docker
docker version

# Install Docker Compose
 sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 sudo chmod +x /usr/local/bin/docker-compose
 sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
 docker-compose --version

 # Install elastic agent
curl -O https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.0.1-amd64.deb
sudo dpkg -i elastic-agent-8.0.1-amd64.deb

systemctl restart elastic-agent.service
systemctl start elastic-agent.service
systemctl status elastic-agent.service
