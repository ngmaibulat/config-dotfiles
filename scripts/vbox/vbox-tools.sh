#!/bin/bash


sudo pacman -Sy
sudo pacman -S virtualbox-guest-utils

sudo modprobe -a vboxguest vboxsf vboxvideo


echo vboxguest >  /etc/modprobe.d/virtualbox.conf
echo vboxsf    >> /etc/modprobe.d/virtualbox.conf
echo vboxvideo >> /etc/modprobe.d/virtualbox.conf

