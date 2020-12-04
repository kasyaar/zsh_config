#!/usr/bin/env sh
apt-get update
apt-get -y install  curl zsh vim git tmux
git clone https://github.com/kasyaar/oh-my-zsh .zsh
ln -s ~/.zsh/zshrc .zshrc
ln -s ~/.zsh/.tmux.conf ~/.tmux.conf
ln -s ~/.zsh/.gitconfig .gitconfig

git clone https://github.com/kasyaar/vim_config .vim
ln -s ~/.vim/vimrc .vimhrc
vim +PlugInstall +qall

