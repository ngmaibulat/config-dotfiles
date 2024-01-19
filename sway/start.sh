#!/bin/bash

export WLR_NO_HARDWARE_CURSORS=1
export XCURSOR_THEME=Vimix-White
export XCURSOR_SIZE=32

export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

export LIBSEAT_BACKEND=logind

exec sway

