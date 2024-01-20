
function start-gnome() {

    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=GNOME
    gnome-session
}


