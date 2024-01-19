#!/bin/bash

sudo pacman -S gpm --noconfirm

sudo systemctl enable gpm
sudo systemctl start gpm

