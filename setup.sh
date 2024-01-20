#!/bin/bash

cp bashrc/bashrc.sh  ~/.bashrc
cp vimrc/vimrc       ~/.vimrc

cp gitconfig/gitconfig-aibulat ~/.gitconfig

cat functions/basic.sh          >> ~/.bashrc
cat functions/get-wallpapers.sh >> ~/.bashrc
cat functions/set-wallpaper.sh  >> ~/.bashrc
cat functions/sudoers.sh        >> ~/.bashrc
cat functions/start-gnome.sh    >> ~/.bashrc
cat functions/install-vmware-tools.sh >> ~/.bashrc

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

echo source .bashrc > ~/.profile
#echo source .bashrc > .bash_profile

