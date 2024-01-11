#!/bin/bash

### Base

sudo pacman --noconfirm -S open-vm-tools openssh git python python-pip zsh make fakeroot gcc go archinstall

### CLI tools

sudo pacman -S htop bashtop calcurse  bat glow vim neovim neofetch fastfetch tmux tldr lf mc --noconfirm

### X11

sudo pacman -S feh pcmanfm --noconfirm

### Media

sudo pacman -S cmus --noconfirm

### GUI

sudo pacman -S chromium obs-studio  --noconfirm


