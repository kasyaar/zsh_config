#!/usr/bin/env bash
sudo apt-get install zsh vim git
git clone https://github.com/kasyaar/oh-my-zsh .zsh
ln -s ~/.zsh/zshrc .zshrc
ln -s ~/.zsh/.gitconfig .gitconfig
sudo chsh -s /usr/bin/zsh kasyaar

git clone https://github.com/kasyaar/vim_config .vim
ln -s ~/.vim/vimrc .vimhrc
vim -c ":PlugInstall"

