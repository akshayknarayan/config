#!/bin/sh

#pacman -S python-pip vim starship eza bat fzf fd ripgrep

#oh-my-zsh
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# rust
#curl https://sh.rustup.rs -sSf | sh -s -- -y

rustup component add rls rust-analysis rust-src

cargo install alacritty

# link config files
ln -s ~/config/.bash_profile ~/.bash_profile
ln -s ~/config/.gitconfig ~/.gitconfig
ln -s ~/config/.gitignore ~/.gitignore
ln -s ~/config/.tmux.conf ~/.tmux.conf
rm ~/.zshrc
ln -s ~/config/.zshrc ~/.zshrc
ln -s ~/config/.vimrc ~/.vimrc
ln -s ~/config/starship.toml ~/.config/starship.toml
