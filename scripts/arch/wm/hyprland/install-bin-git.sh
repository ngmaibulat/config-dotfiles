#!/bin/bash

cp Hyprland  /bin/Hyprland
cp hyprctl   /bin/hyprctl

cp libwlroots.so.*  /usr/lib/libwlroots.so.13032

cp example/hyprland.desktop /usr/share/wayland-sessions/hyprland.desktop

ln -s /usr/lib/libwlroots.so.13032 /usr/lib/libwlroots.so

