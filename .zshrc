export ZSH=/Users/$(whoami)/.oh-my-zsh
export TERM=xterm-256color
export GOPATH=/home/$(whoami)/go-work
export PATH=/opt/bin:${GOPATH}/bin:/usr/local/go/bin:~/.cargo/bin:/snap/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/$(whoami)/.oh-my-zsh

plugins=(git tmux web-search safe-paste zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,underline"

# tmux plugin
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_FIXTERM=true
ZSH_TMUX_AUTOQUIT=false

if test -z "$SSH_AUTH_SOCK" ; then
    eval $(ssh-agent -s) > /dev/null
fi

alias ls=eza

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf configuration
export FZF_DEFAULT_COMMAND='rg . --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd"

disable r

eval "$(starship init zsh)"
