#!/bin/sh

if !which brew
then	
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew install git vim tmux the_silver_searcher python python3 mobile-shell nmap macvim colormake watch wget zsh fzf
brew tap caskroom/cask
brew cask install Seil google-chrome xquartz mactex

#Enable ECN
sudo sysctl -w net.inet.tcp.ecn_initiate_out=1
sudo sysctl -w net.inet.tcp.ecn_negotiate_in=1

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir -p ~/etc
cd ~/etc

curl -O http://www.marksimonson.com/assets/content/fonts/AnonymousPro-1.002.zip
unzip AnonymousPro-1.002.zip

cd ~

# fzf
$(brew --prefix)/opt/fzf/install

# link config files
ln -s ~/config/.bash_profile ~/.bash_profile
ln -s ~/config/.gitconfig ~/.gitconfig
ln -s ~/config/.gitignore ~/.gitignore
ln -s ~/config/.tmux.conf ~/.tmux.conf
ln -s ~/config/.zshrc ~/.zshrc

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
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/w0rp/ale.git
git clone https://github.com/autozimu/LanguageClient-neovim.git

cd ~/config
ln -s ~/config/.vimrc ~/.vimrc
