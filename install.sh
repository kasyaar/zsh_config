#!/usr/bin/env sh
missing=""
commands="unzip curl zsh"
set -- $commands
for command; do
  command -v "$command" > /dev/null 2>&1 || { echo "Error: $command not found"; missing="$missing $command"; }
done

if [ -z "$missing" ]; then
  echo "Installing zsh_config"
else
  echo "The following apps are missing: $missing"
  exit 1
fi

echo "Baking up old .zsh folder"
mv ~/.zsh ~/.zsh.$(date +%Y%m%d-%H%M%S) > /dev/null 2>&1
if command -v git > /dev/null 2>&1; then
  echo "Clonning https://github.com/kasyaar/zsh_config.git to .zsh..."
  git clone https://github.com/kasyaar/zsh_config.git ~/.zsh > /dev/null 2>&1
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.zsh/custom}/themes/powerlevel10k
else
  echo "GIT is not installed. Getting code archive."
  if command -v unzip  > /dev/null 2>&1; then
    echo "Getting kasyaar/zsh_config"
    curl -sSL -o /tmp/zsh_config.zip  https://github.com/kasyaar/zsh_config/archive/refs/heads/master.zip
    echo "Unpackign to .zshrc"
    unzip -d ~/ /tmp/zsh_config.zip > /dev/null 2>&1 
    echo "Getting romkatv/poverlevel10k"
    curl -sSL -o /tmp/p10k.zip  https://github.com/romkatv/powerlevel10k/archive/refs/heads/master.zip
    echo "Unpackign powerlevel10k"
    unzip -d ~/ /tmp/p10k.zip > /dev/null 2>&1 
    [ -d .zsh ] && mv .zsh .zsh.orig
    mv ~/zsh_config-master ~/.zsh
    rm /tmp/zsh_config.zip
    mv ~/powerlevel10k-master ~/.zsh/custom/themes/powerlevel10k
    rm /tmp/p10k.zip
  else
    echo "UNZIP is not installed. Please install and run again."
    exit
  fi
fi
echo "Installing fonts"
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf > /dev/null 2<&1
echo "Creating symlinks..."
ln -sf ~/.zsh/.zshrc ~/ > /dev/null 2>&1
ln -sf ~/.zsh/.tmux.conf ~/ > /dev/null 2>&1
ln -sf ~/.zsh/.gitconfig ~/ > /dev/null 2>&1
if command -v zsh > /dev/null 2>&1; then
  echo "Creating .ssh dir"
  [ -d ~/.ssh ] || mkdir ~/.ssh
  #echo "Set zsh to default shell"
  #[ command -v chsh  > /dev/null 2>&1 ] && chsh -s $(which zsh) || echo 'chsh unavailable.'
  chmod go-w ~/.zsh ~/.zsh/custom ~/.zsh/cache
  echo "Done"
  echo "Run this command to make zsh your default shell: chsh -s $(which zsh)"
else
  echo "ZSH is not installed. Please install and run again."
  exit
fi
