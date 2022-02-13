#! /bin/bash

export MASTER_IP="10.0.0.10"
export POD_CIDR="192.168.0.0/16"
export CONTROL_PLANE_IP="192.168.0.200"

sudo kubeadm config images pull

echo "Preflight Check Passed: Downloaded All Required Images"

cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo kubeadm reset

# Save Configs to shared /Vagrant location
# For Vagrant re-runs, check if there is existing configs in the location and delete it for saving new configuration.
config_path="/vagrant/configs"

if [ -d $config_path ]; then
   rm -f $config_path/*
else
   mkdir -p /vagrant/configs
fi

touch /vagrant/configs/output.txt

# sudo kubeadm init --apiserver-advertise-address=$MASTER_IP  --apiserver-cert-extra-sans=$MASTER_IP --pod-network-cidr=$POD_CIDR  --ignore-preflight-errors Swap
sudo kubeadm init --control-plane-endpoint "$CONTROL_PLANE_IP:6443" --upload-certs > /vagrant/configs/output.txt

sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

cp -i /etc/kubernetes/admin.conf /vagrant/configs/config
