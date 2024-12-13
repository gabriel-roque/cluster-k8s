#! /bin/bash

IP_FIRST_MASTER=$(hostname -I | awk '{print $2}')

# Init Cluster Docker Swarm
docker swarm init --advertise-addr $IP_FIRST_MASTER

config_path="/vagrant/configs"

if [ -d $config_path ]; then
   rm -f $config_path/*
else
   mkdir -p /vagrant/configs
fi

# Get command join more master nodes
TOKEN_MASTER=$(docker swarm join-token manager -q)
TOKEN_WORKER=$(docker swarm join-token worker -q)

echo docker swarm join --token $TOKEN_MASTER $IP_FIRST_MASTER:2377 > /vagrant/configs/master-join.sh
echo docker swarm join --token $TOKEN_WORKER $IP_FIRST_MASTER:2377 > /vagrant/configs/worker-join.sh