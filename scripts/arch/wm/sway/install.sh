#!/bin/bash

sudo pacman -S sway which alacritty wofi bemenu-wayland  --noconfirm
sudo pacman -S xorg-server-xwayland

# optional
sudo pacman -S  dmenu rofi kitty foot

usermod -a -G seat admin

