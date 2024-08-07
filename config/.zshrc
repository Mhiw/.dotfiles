export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode reminder

HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_GB.UTF-8

export ARCHFLAGS="-arch x86_64"

alias nv="nvim"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

export EMSDK_QUIET=1

# Created by `pipx` on 2024-06-07 17:24:05
export PATH="$PATH:/home/wi/.local/bin"
