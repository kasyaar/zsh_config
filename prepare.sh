#!/usr/bin/env bash
sudo useradd -m -G adm,sudo,netdev,users  ${1} 
sudo mkdir /home/${1}/.ssh
sudo chsh -s /bin/bash kasyaar
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCttvVVU1t1/OUmOs0VCLlxLjIkFe71BM3cDU4ILz0wj+b++ci7wyYze1koQ4yNWQCHPgRTr8QDZ0J88Xdwh6KFbo/MBJsA37sNIoEm521eiswHEpInP6LL5uCpjlOQWM0P/GsUOAsthiQVoWbe5yeVPGmbbc9BiIBEJvnZLyZki+X1Olja9zaZjhK+smTVDoU+McUyKm4qyngrd7mgT/zqn/xRGgRK2H+lsgg29oRVdHutFK0+H/Uy7gmsFgjk8O+a8Tt80SsJ54aRRTgb/LcDKI1dRkE7k+zeveuC9uR16FPbNruP+Dc4QL394GG7cJbgwS15Ix59ndjOSIC8rxll kasyaar@Dmitrys-MBP"|sudo tee /home/${1}/.ssh/authorized_keys
echo "Don't forget to set user: ${1} password"
