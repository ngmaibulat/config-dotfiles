#!/bin/bash

### Base

sudo pacman --noconfirm -S open-vm-tools openssh git python zsh make fakeroot gcc go

### CLI tools

sudo pacman -S bat glow vim neovim neofetch fastfetch tmux tldr --noconfirm

### X11

sudo pacman -S feh --noconfirm

