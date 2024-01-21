#!/bin/bash

xrandr --output Virtual-1 --mode 1920x1200 --dpi 220

# xsetroot -cursor_name left_ptr &

xrdb -merge ~/.Xresources

exec budgie-desktop

