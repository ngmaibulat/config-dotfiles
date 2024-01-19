#!/bin/bash


pacman -Sy --noconfirm

pacman -S xorg-xinit xorg-xrandr xorg-setxkbmap xf86-video-vmware xf86-input-vmmouse  xorg-server gnome gdm --noconfirm

pacman -S ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-ukai ttf-arphic-uming ttf-hanazono --noconfirm

systemctl enable gdm

systemctl start gdm

