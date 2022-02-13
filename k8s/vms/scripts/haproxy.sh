#! /bin/bash

sudo apt install haproxy <<< "y"

sudo su -

cat <<EOT >> /etc/haproxy/haproxy.cfg
frontend kubernetes
   mode tcp
   bind 192.168.0.200:6443
   option tcplog
   default_backend k8s-masters

backend k8s-masters
   mode tcp
   balance roundrobin
   option tcp-check
  #  server k8s-master-01 10.0.0.10:6443 check fall 3 rise 2
  #  server k8s-master-02 10.0.0.11:6443 check fall 3 rise 2
  #  server k8s-master-03 10.0.0.12:6443 check fall 3 rise 2
EOT

systemctl restart haproxy.service
systemctl status haproxy.service

