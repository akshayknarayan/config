export CLICOLOR=1
export TERM=xterm-256color

export PS1='\[\e[0;37m\]\u@\h:\[\e[0;33m\]\w\[\e[0;37m\]\$ \[\e[m\]'

. "$HOME/.cargo/env"

exec /bin/zsh -l
