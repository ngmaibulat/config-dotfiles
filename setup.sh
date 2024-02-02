#!/bin/bash

# Check the operating system
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\nThis is MacOS.\nYou might have wanted to run vim\n\n"
    exit 1
fi

cp bashrc/bashrc.sh  ~/.bashrc
cp bashrc/aliases.sh ~/.config/aliases.sh

cp gitconfig/gitconfig-aibulat ~/.gitconfig

### vim
mkdir -p ~/.config/vim
cp vim/vimrc ~/.config/vim/vimrc
ln -s ~/.config/vim/vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### nvim
git clone https://github.com/nvim-lua/kickstart.nvim.git $HOME/.config/nvim

### pyenv
mkdir -p ~/.config/pyenv
cp pyenv/init.sh ~/.config/pyenv/init.sh

### bin
cp -r bin ~/bin

### functions
cfg=$HOME/.config/bash
mkdir -p $cfg
cp -r functions $cfg

echo source $cfg/functions/basic.sh                >> ~/.bashrc
echo source $cfg/functions/get-wallpapers.sh       >> ~/.bashrc
echo source $cfg/functions/set-wallpaper.sh        >> ~/.bashrc
echo source $cfg/functions/set-wallpaper-gnome.sh  >> ~/.bashrc
echo source $cfg/functions/sudoers.sh              >> ~/.bashrc
echo source $cfg/functions/start-gnome.sh          >> ~/.bashrc
echo source $cfg/functions/install-vmware-tools.sh >> ~/.bashrc

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

