#!/bin/sh

sudo apt-get update

#basics
sudo apt-get install -y git vim tmux build-essential python3 python3-pip r-base r-base-dev curl mosh zsh silversearcher-ag cmake

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# enable ECN
sudo echo 1 > /proc/sys/net/ipv4/tcp_ecn

mkdir -p ~/etc
cd ~/etc

curl -O http://www.marksimonson.com/assets/content/fonts/AnonymousPro-1.002.zip
unzip AnonymousPro-1.002.zip
mkdir ~/.fonts
find . -name "*.ttf" -exec cp {} ~/.fonts \;

cd ~

# rust
curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain=nightly -y

rustup component add rls rust-analysis rust-src
cargo install install-update
cargo install alacritty
cargo install bat
cargo install exa
cargo install fd-find
cargo install rg

# golang
GO_TARBALL=go1.10.3.linux-amd64.tar.gz
wget https://dl.google.com/go/$GO_TARBALL
sudo tar -C /usr/local -xzf $GO_TARBALL
mkdir ~/go-work
rm $GO_TARBALL

# python3
sudo pip3 install numpy matplotlib xonsh

# link config files
ln -s ~/config/.bash_profile ~/.bash_profile
ln -s ~/config/.gitconfig ~/.gitconfig
ln -s ~/config/.gitignore ~/.gitignore
ln -s ~/config/.tmux.conf ~/.tmux.conf
rm ~/.zshrc
ln -s ~/config/.zshrc ~/.zshrc
ln -s ~/config/.vimrc ~/.vimrc
