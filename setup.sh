#!/bin/bash

# Check the operating system
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\nThis is MacOS.\nYou might have wanted to run vim\n\n"
    exit 1
fi

# bash
mkdir -p ~/.config
cp -r bashrc ~/.config/bash
cp bashrc/bashrc.sh  ~/.bashrc

cp gitconfig/gitconfig-aibulat ~/.gitconfig

### vim
mkdir -p ~/.config/vim
cp vim/vimrc ~/.config/vim/vimrc
ln -s ~/.config/vim/vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### nvim
git clone https://github.com/nvim-lua/kickstart.nvim.git $HOME/.config/nvim

### starship
starship preset gruvbox-rainbow -o ~/.config/starship.toml

### pyenv
mkdir -p ~/.config/pyenv
cp pyenv/init.sh ~/.config/pyenv/init.sh

### bin
cp -r bin ~/bin

### X11
cp X11/xinitrc-qtile.sh ~/.xinitrc
cp X11/Xresources-dpi-220 ~/.Xresources

### qtile
mkdir -p ~/.config/qtile
cp qtile/config-01.py ~/.config/qtile/config.py

### i3
mkdir -p ~/.config/i3
cp i3/config  ~/.config/i3/config

### sway
mkdir -p ~/.config/sway
cp sway/config    ~/.config/sway/config
cp sway/start.sh  ~/.config/sway/start.sh

source ~/.bashrc

echo source ~/.bashrc > ~/.profile
#echo source .bashrc > .bash_profile

