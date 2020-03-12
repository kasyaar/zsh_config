#!/usr/bin/env bash
sudo useradd -m -G adm,sudo,netdev,users  ${1} 
sudo mkdir /home/${1}/.ssh
sudo chsh -s /bin/bash kasyaar
echo ""|sudo tee /home/${1}/.ssh/authorized_keys
echo "Don't forget to set user: ${1} password"
