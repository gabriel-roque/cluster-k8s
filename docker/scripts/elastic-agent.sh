#! /bin/bash

sudo su -

# Install elastic agent
curl -O https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.10.0-amd64.deb
sudo dpkg -i elastic-agent-8.10.0-amd64.deb

systemctl stop elastic-agent.service
systemctl start elastic-agent.service
systemctl enable elastic-agent.service
systemctl status elastic-agent.service