#!/bin/sh

#Enable ECN
sudo sysctl -w net.inet.tcp.ecn_initiate_out=1
sudo sysctl -w net.inet.tcp.ecn_negotiate_in=1

##if !which brew
##then	
##    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
##fi
##brew install git vim tmux the_silver_searcher python python3 mobile-shell nmap macvim colormake watch wget zsh fzf golang cmake
##brew tap caskroom/cask
##brew cask install Seil google-chrome xquartz mactex

#oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#mkdir -p ~/etc
#cd ~/etc

cd ~

# rust
#curl https://sh.rustup.rs -sSf | sh

# fzf
#$(brew --prefix)/opt/fzf/install

# link config files
ln -s ~/config/.bash_profile ~/.bash_profile
ln -s ~/config/.gitconfig ~/.gitconfig
ln -s ~/config/.gitignore ~/.gitignore
ln -s ~/config/.tmux.conf ~/.tmux.conf
ln -s ~/config/.zshrc ~/.zshrc

# vim stuff
mkdir -p ~/.vim
cd ~/.vim

cd ~/config
ln -s ~/config/.vimrc ~/.vimrc
