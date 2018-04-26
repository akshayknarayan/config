#!/bin/sh

# link config files
ln -s ~/config/.bash_profile ~/.bash_profile
ln -s ~/config/.gitconfig ~/.gitconfig
ln -s ~/config/.gitignore ~/.gitignore
ln -s ~/config/.tmux.conf ~/.tmux.conf

# vim stuff
mkdir -p ~/.vim
cd ~/.vim
git clone https://github.com/tpope/vim-pathogen.git
cp -r vim-pathogen/autoload/ .

# vim plugins
mkdir -p bundle
cd bundle
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/w0rp/ale.git
git clone https://github.com/autozimu/LanguageClient-neovim.git

cd ~/config
ln -s ~/config/.vimrc ~/.vimrc
