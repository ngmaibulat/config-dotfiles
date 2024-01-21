#!/bin/bash

sudo dnf install mesa-dri-drivers mesa-libGL mesa-libGLU mesa-demos

glxinfo | grep -i render
glxinfo | grep -i opengl

glmark2

