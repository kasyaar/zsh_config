# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
[[ -e "$HOME/.profile" ]] && source $HOME/.profile
if [[ -z "$DISABLE_POWERLINE" && -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# OPENSPEC,HERDR:START
# OpenSpec shell completions configuration
fpath=("$HOME/.zsh/completions" $fpath)
# OPENSPEC,HERDR:END


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="kparty" 

if [[ -z "$DISABLE_POWERLINE" ]]; then
    ZSH_THEME="powerlevel10k/powerlevel10k"
else
    ZSH_THEME="minimal"
fi
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias g=git

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

typeset -U path PATH
path=($path $HOME/bin $HOME/.local/bin)
export PATH

plugins=()
(( $+commands[ssh-agent] )) && plugins+=(ssh-agent)
(( $+commands[tmux] ))      && plugins+=(tmux)
(( $+commands[sudo] ))      && plugins+=(sudo)
(( $+commands[git] ))       && plugins+=(git)
(( $+commands[jj] ))        && plugins+=(jj)
(( $+commands[uv] ))        && plugins+=(uv)
(( $+commands[python] ))    && plugins+=(python)
(( $+commands[go] ))        && plugins+=(golang)
(( $+commands[cargo] ))     && plugins+=(rust)
(( $+commands[llm] ))       && plugins+=(llm)

if (( $+commands[fzf] )); then
  plugins+=(fzf)
  (( $+commands[bat] )) && CAT="bat --color always -n" || CAT="cat"
  export FZF_DEFAULT_OPTS="--layout reverse --height 40% --border --preview '$CAT {}' --preview-window='wrap'"
  export FZF_CTRL_R_OPTS="--preview 'man {2}'"
fi

#[[ -n $(command -v vim) ]] && export EDITOR=vim
(( $+commands[vim] )) && export EDITOR=vim

source $ZSH/oh-my-zsh.sh

# for debian/ubuntu
[[ -r /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -z "$DISABLE_POWERLINE" && -r ~/.zsh/p10k.zsh ]] && source ~/.zsh/p10k.zsh
