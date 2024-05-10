#!/bin/bash
# Declare the associative array
declare -A distscmd
dists=("debian" "void")


# Add commands for Debian
distscmd["debian",0]="apt update -y "
distscmd["debian",1]="apt install -y curl zsh vim git tmux mc"

# Add commands for Void Linux
distscmd["void",0]="xbps-install -Syu "
distscmd["void",1]="xbps-install -y curl zsh zsh-completions vim-huge-python3 git tmux mc"


choose_dist() {
    i=1
    cdist=$(dialog --stdout --title "Choose Your Distributive" --radiolist "Select a disk:" 15 70 4 \
        $(for dist in  "${dists[@]}"; do echo "$dist" "$i" off; ((i++)); done))
    
    if [ $? -eq 0 ]; then
        echo $cdist
        UPDATE=${distscmd[$cdist,0]}
        INSTALL=${distscmd[$cdist,1]}
    else
        echo "You canceled."
        exit
    fi
}
echo_cmd() {
    local cmd="$1"
    echo -e "\033[0;32m\033[1m$cmd\033[0m"
}
choose_dist
echo_cmd "$UPDATE"
$UPDATE
echo_cmd "$INSTALL"
$INSTALL
echo_cmd "Set zsh to default shell"
chsh -s $(which zsh) $USER
echo_cmd "Creating .ssh dir"
[[ -d ~/.ssh ]] && mkdir .ssh
echo_cmd "Cloning zsh config"
git clone https://github.com/kasyaar/oh-my-zsh ~/.zsh
ln -sf ~/.zsh/.zshrc ~/
ln -sf ~/.zsh/.tmux.conf ~/
ln -sf ~/.zsh/.gitconfig ~/

echo_cmd "Cloning vim config"
git clone https://github.com/kasyaar/vim_config ~/.vim
ln -sf ~/.vim/.vimrc ~/
ln -sf ~/.vim/.gvimrc ~/
vim +PlugInstall +qall
