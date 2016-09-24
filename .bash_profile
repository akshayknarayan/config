export CLICOLOR=1
export TERM=xterm-256color

export PS1='\[\e[0;37m\]\u@\h:\[\e[0;33m\]\w\[\e[0;37m\]\$ \[\e[m\]'

eval `dircolors ~/.colorscheme/dircolors`
export LS_COLORS='di=1:*.h=31:*.cpp=34:*.py=34'

export GOPATH=~/go-work
export PATH=/opt/bin:$GOPATH/bin:$PATH

