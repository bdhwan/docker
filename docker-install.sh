#!/bin/bash
sudo apt-get update
sudo apt-get install -y sshpass

sudo \cp docker /etc/default/ 
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get -y install docker-ce

#copy iptables port 
sudo \cp rule.v4 /etc/iptables/rules.v4 

sudo netfilter-persistent reload
echo 'done install docker ce'

sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker

sudo service docker restart

exit 0
