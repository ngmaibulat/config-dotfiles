#!/bin/bash


pacman -Sy --noconfirm

pacman -S gnome gdm --noconfirm

systemctl enable gdm

systemctl start gdm

