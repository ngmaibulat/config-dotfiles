#!/bin/bash


sudo pacman -S mesa mesa-utils glmark2 libglvnd


### test

glmark2

glxgears

glxinfo | grep -i opengl
glxinfo | grep -i render

### Chrome
#
# chrome://gpu
# chrome://flags - enable GPU related features


