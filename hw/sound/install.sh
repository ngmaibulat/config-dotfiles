#!/bin/bash

sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber easyeffects pavucontrol

systemctl --user enable pipewire
systemctl --user start pipewire
systemctl --user enable pipewire-pulse
systemctl --user start pipewire-pulse

