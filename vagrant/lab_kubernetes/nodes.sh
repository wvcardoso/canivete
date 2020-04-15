#!/bin/bash

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

sudo yum install -y -q \
    net-tools \
    wget \
    docker \
    kubelet \
    kubeadm \
    kubectl --nogpgcheck

# enable services
sudo systemctl enable kubelet
sudo systemctl enable docker

# starting
sudo systemctl start kubelet
sudo systemctl start docker

# /etc/hosts
echo "192.168.10.101  master-node"  >> /etc/hosts
echo "192.168.10.102  worker-node1" >> /etc/hosts
echo "192.168.10.103  worker-node2" >> /etc/hosts

# Update Iptables Settings 
cat > /etc/sysctl.d/k8s.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

# Disable SELinux
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# Disable SWAP
sudo sed -i '/swap/d' /etc/fstab
sudo swapoff -a

systemctl start firewalld
systemctl enable firewalld
