#!/bin/bash

yay -S hyprland-git --noconfirm

sudo pacman -S kitty foot alacritty rofi wofi dmenu seatd  --noconfirm

sudo pacman -S xdg-desktop-portal-hyprland waybar grim slurp swayidle swappy cliphist --noconfirm

sudo systemctl enable seatd
sudo systemctl start seatd


