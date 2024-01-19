#!/bin/bash

sudo pacman -S wget

wget https://github.com/hyprwm/Hyprland/releases/download/v0.34.0/v0.34.0.tar.gz

tar -xvf *.tar.gz

cd hyprland

sudo cp Hyprland  /bin/Hyprland
sudo cp hyprctl   /bin/hyprctl

sudo cp libwlroots.so.*  /usr/lib/libwlroots.so.13032

sudo cp example/hyprland.desktop /usr/share/wayland-sessions/hyprland.desktop

ln -s /usr/lib/libwlroots.so.13032 /usr/lib/libwlroots.so

