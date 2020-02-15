export ZSH=/Users/$(whoami)/.oh-my-zsh
export PATH=~/.local/bin:/opt/bin:${GOPATH}/bin:/usr/local/go/bin:~/.cargo/bin:/snap/bin:$PATH
export TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH=/home/$(whoami)/.oh-my-zsh

autoload -Uz compinit promptinit
compinit
promptinit

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="pygmalion"
>>>>>>> 3bcb089 (zshrc update)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
if test -z "$SSH_AUTH_SOCK" ; then
    eval $(ssh-agent -s) > /dev/null
fi

alias ls=exa

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf + ag configuration
export FZF_DEFAULT_COMMAND='rg . --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd"

man() {
    env \
      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
      LESS_TERMCAP_md=$(printf "\e[1;31m") \
      LESS_TERMCAP_me=$(printf "\e[0m") \
      LESS_TERMCAP_se=$(printf "\e[0m") \
      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
      LESS_TERMCAP_ue=$(printf "\e[0m") \
      LESS_TERMCAP_us=$(printf "\e[1;32m") \
      command man "$@"
}

prompt off
eval "$(starship init zsh)"
