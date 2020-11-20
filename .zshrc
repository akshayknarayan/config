# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH=~/golang
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/Cellar/perl/5.24.1/bin

# Path to your oh-my-zsh installation.
export ZSH=/Users/$(whoami)/.oh-my-zsh
export PATH="/usr/local/opt/openssl/bin:$PATH"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pygmalion"
plugins=(git tmux web-search safe-paste)
source $ZSH/oh-my-zsh.sh

# User configuration

# tmux plugin
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_FIXTERM=true
ZSH_TMUX_AUTOQUIT=false

alias ls=exa

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf + ag configuration
export FZF_DEFAULT_COMMAND='rg . --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd"

# fzf + ag configuration
export FZF_DEFAULT_COMMAND='rg . --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

alias ls=exa

disable r
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"
