# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="kparty" 
ZSH_THEME="powerlevel10k/powerlevel10k" 
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias g=git

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git ssh-agent sudo tmux tmuxide)
plugins=()
[[ -n $(command -v ssh-agent) ]] && plugins+=(ssh-agent)
[[ -n $(command -v tmux) ]] && plugins+=(tmux)
[[ -n $(command -v sudo) ]] && plugins+=(sudo)
[[ -n $(command -v git) ]] && plugins+=(git)
[[ -n $(command -v jj) ]] && plugins+=(jj)
[[ -n $(command -v uv) ]] && plugins+=(uv)
[[ -n $(command -v python) ]] && plugins+=(python)
[[ -n $(command -v go) ]] && plugins+=(golang)
[[ -n $(command -v cargo) ]] && plugins+=(rust) && source $HOME/.cargo/env

[[ -n $(command -v fzf) ]] && plugins+=(fzf) && \
  export FZF_DEFAULT_OPTS="--layout reverse --height 41% --border --tmux bottom,40% --preview 'bat --color always -n {}'" && \
  export FZF_CTRL_R_OPTS="--preview ''" && \
  export FZT_COMPLETION_TRIGGER="**"

[[ -n $(command -v vim) ]] && export EDITOR=vim
[[ -n $(command -v bat) ]] && alias bat="bat --color always -n" || alias bat=cat

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:$HOME/bin:$HOME/.local/bin

# for debian/ubuntu
[[ ! -f /etc/zsh_command_not_found ]] || source /etc/zsh_command_not_found


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
