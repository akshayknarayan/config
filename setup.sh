#!/bin/sh

sudo apt-get update

#basics
sudo apt-get install -y git vim tmux python3 python3-pip curl zsh

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# enable ECN
sudo echo 1 > /proc/sys/net/ipv4/tcp_ecn

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

# link config files
ln -s ~/config/.bash_profile ~/.bash_profile
ln -s ~/config/.gitconfig ~/.gitconfig
ln -s ~/config/.gitignore ~/.gitignore
ln -s ~/config/.tmux.conf ~/.tmux.conf
rm ~/.zshrc
ln -s ~/config/.zshrc ~/.zshrc
ln -s ~/config/.vimrc ~/.vimrc
