#!/bin/bash

set +e
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo apt install -y bash-completion
source <(kubectl completion bash)
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo  "alias g=git">> ~/.bashrc
echo  "alias k=kubectl">> ~/.bashrc
echo  'alias kgp="kubectl get pod"'>> ~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
source ~/.bashrc
sudo apt -y install snapd
sudo snap install yq
sudo snap install fx

sudo apt install docker-compose
export now="--force --grace-period 0"
echo  'now="--force --grace-period 0"'>> ~/.bashrc


bash <(wget -O- get.docker.com)
sudo gpasswd -a $USER docker
newgrp docker
