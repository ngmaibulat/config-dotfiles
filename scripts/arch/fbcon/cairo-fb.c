#include <cairo.h>
#include <fcntl.h>
#include <linux/fb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <unistd.h>

int main() {
    int fbfd = 0; // Framebuffer file descriptor
    struct fb_var_screeninfo vinfo;
    struct fb_fix_screeninfo finfo;
    long int screensize = 0;
    char *fbp = 0;

    // Open the framebuffer device file
    fbfd = open("/dev/fb0", O_RDWR);
    if (fbfd == -1) {
        perror("Error: cannot open framebuffer device");
        return(1);
    }

    // Get fixed screen information
    if (ioctl(fbfd, FBIOGET_FSCREENINFO, &finfo)) {
        perror("Error reading fixed information");
        exit(2);
    }

    // Get variable screen information
    if (ioctl(fbfd, FBIOGET_VSCREENINFO, &vinfo)) {
        perror("Error reading variable information");
        exit(3);
    }

    // Figure out the size of the screen in bytes
    screensize = vinfo.yres_virtual * finfo.line_length;

    // Map the device to memory
    fbp = (char *)mmap(0, screensize, PROT_READ | PROT_WRITE, MAP_SHARED, fbfd, 0);
    if ((int)fbp == -1) {
        perror("Error: failed to map framebuffer device to memory");
        exit(4);
    }
    memset(fbp, 0, screensize); // Clear screen to black

    // Create Cairo surface and context
    cairo_surface_t *cairo_surface = cairo_image_surface_create_for_data((unsigned char *)fbp, CAIRO_FORMAT_ARGB32, vinfo.xres, vinfo.yres, cairo_format_stride_for_width(CAIRO_FORMAT_ARGB32, vinfo.xres));
    cairo_t *cr = cairo_create(cairo_surface);

    // Drawing operations
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size(cr, 50);
    cairo_move_to(cr, 100, 100);
    cairo_set_source_rgb(cr, 1.0, 1.0, 1.0); // White color
    cairo_show_text(cr, "Hello, Cairo on Framebuffer!");

    // Cleanup
    cairo_destroy(cr);
    cairo_surface_destroy(cairo_surface);
    munmap(fbp, screensize);
    close(fbfd);

    return 0;
}


