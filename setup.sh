#!/bin/bash

cp bashrc/bashrc.sh  ~/.bashrc
cp vimrc/vimrc       ~/.vimrc

cat functions/basic.sh          >> ~/.bashrc
cat functions/get-wallpapers.sh >> ~/.bashrc
cat functions/set-wallpaper.sh  >> ~/.bashrc

