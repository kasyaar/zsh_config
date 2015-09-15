# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kparty"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:$HOME/bin:$HOME/apps/sbt/bin:$HOME/local/bin

# Customize to your needs...
# PATH=$PATH:$HOME/.rvm/bin:$HOME/local/bin # Add RVM to PATH for scripting

export EDITOR=vim

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
export PATH=$HOME/.rvm/gems/ruby-1.9.3-p547/bin:$HOME/.rvm/gems/ruby-1.9.3-p547@global/bin:$HOME/.rvm/rubies/ruby-1.9.3-p547/bin:$HOME/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.6.2:/usr/games/bi:n:$HOME/bin:$HOME/.rvm/bin:/usr/games/bin:$PATH

export `gnome-keyring-daemon --start`

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
