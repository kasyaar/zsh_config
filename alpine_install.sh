#!/usr/bin/env sh
apk update
apk add curl zsh vim git tmux
git clone https://github.com/kasyaar/oh-my-zsh .zsh
ln -s ~/.zsh/zshrc .zshrc
ln -s ~/.zsh/.tmux.conf ~/.tmux.conf
ln -s ~/.zsh/.gitconfig .gitconfig

git clone https://github.com/kasyaar/vim_config .vim
ln -s ~/.vim/vimrc .vimrc
vim +PlugInstall +qall

