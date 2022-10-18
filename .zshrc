export ZSH=/Users/$(whoami)/.oh-my-zsh
export PATH="/opt/homebrew/bin:/Users/$(whoami)/etc/bin:$PATH"

plugins=(git tmux web-search safe-paste zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# User configuration

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,underline"

# tmux plugin
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_FIXTERM=true
ZSH_TMUX_AUTOQUIT=false

alias ls=eza

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf configuration
export FZF_DEFAULT_COMMAND='rg . --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd"

disable r

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"
