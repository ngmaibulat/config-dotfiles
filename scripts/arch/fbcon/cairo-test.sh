

pacman -S pkg-config cairo

pkg-config --cflags --libs cairo

gcc -o test-cairo test-cairo.c `pkg-config --cflags --libs cairo`

