#!/bin/bash

sudo pacman -S sway which alacritty wofi bemenu-wayland  --noconfirm

# optional
sudo pacman -S xorg-server-xwayland dmenu rofi kitty foot

mkdir -p ~/.config/sway
cp /etc/sway/config ~/.config/sway/

