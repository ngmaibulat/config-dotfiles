#!/bin/bash

sudo pacman -S hyprland kitty foot alacritty rofi seatd  --noconfirm

sudo pacman -S xdg-desktop-portal-hyprland waybar grim slurp swayidle swappy cliphist --noconfirm

sudo systemctl enable seatd
sudo systemctl start seatd


