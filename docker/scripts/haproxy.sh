#! /bin/bash

sudo apt install haproxy <<< "y"

sudo su -

cat <<EOT >> /etc/haproxy/haproxy.cfg
frontend docker-swarm
   mode tcp
   bind 192.168.0.200:80
   option tcplog
   default_backend docker-swarm-masters

backend docker-swarm-masters
   mode tcp
   balance roundrobin
   option tcp-check
   server master-01 192.168.11:80 check fall 3 rise 2
   server master-02 192.168.12:80 check fall 3 rise 2
   server master-03 192.168.13:80 check fall 3 rise 2
EOT

systemctl restart haproxy.service
systemctl status haproxy.service

