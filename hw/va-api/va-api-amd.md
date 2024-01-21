#!/bin/bash

sudo pacman -Syu               # Update your system
sudo pacman -S libva-mesa-driver libva-utils     # Install VA-API driver for AMD and vainfo


export XDG_RUNTIME_DIR=/run/user/`id -u`
vainfo                         # Check VA-API installation and supported codecs

