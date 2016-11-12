#!/bin/sh

os=`uname -a`

if [ `echo $os | grep -c "Darwin"` -eq 1 ]
then
#OS X
	echo "Detected OSX"

	if !which brew
	then	
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	brew install git vim tmux the_silver_searcher python python3 mobile-shell nmap macvim colormake watch wget
	brew tap caskroom/cask
	brew cask install Seil google-chrome xquartz mactex

	#Enable ECN
	sudo sysctl -w net.inet.tcp.ecn_initiate_out=1
	sudo sysctl -w net.inet.tcp.ecn_negotiate_in=1

elif [ `echo $os | grep -c "Ubuntu"` -eq 1 ]
then
	echo "Detected Ubuntu"

	sudo apt-get update

	#basics
	sudo apt-get install -y git vim tmux build-essential gparted python3 curl mosh silversearcher-ag texlive

	# enable ECN
	sudo echo 1 > /proc/sys/net/ipv4/tcp_ecn
fi

# link config files
ln -s ~/config/.bash_profile ~/.bash_profile
ln -s ~/config/.gitconfig ~/.gitconfig
ln -s ~/config/.gitignore ~/.gitignore
ln -s ~/config/.tmux.conf ~/.tmux.conf

# vim stuff
mkdir -p ~/.vim
cd ~/.vim
git clone https://github.com/tpope/vim-pathogen.git
mkdir -p autoload
ln -s ./vim-pathogen/autoload/pathogen.vim autoload/

# vim plugins
mkdir -p bundle
cd bundle
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone --depth=1 https://github.com/scrooloose/syntastic.git

cd ~/config
ln -s ~/config/.vimrc ~/.vimrc



