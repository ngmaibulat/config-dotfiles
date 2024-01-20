#!/bin/bash

sudo pacman -S sway which alacritty wofi bemenu-wayland  --noconfirm
sudo pacman -S xorg-server-xwayland --noconfirm

# seatd
sudo pacman -S seatd

systemctl enable seatd
systemctl start seatd

# optional
sudo pacman -S  dmenu rofi kitty foot --noconfirm

usermod -a -G seat admin

