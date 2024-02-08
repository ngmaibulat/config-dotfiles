### Nerd Fonts

- https://www.nerdfonts.com/font-downloads
- https://www.nerdfonts.com/cheat-sheet
- https://github.com/ryanoasis/nerd-fonts
- https://archlinux.org/groups/any/nerd-fonts/

### Other Downloads

- https://www.fontsquirrel.com/

### TTF

- https://en.wikipedia.org/wiki/TrueType
- Vector Based

### OTF

- https://fonts.google.com/knowledge/glossary/open_type
- https://en.wikipedia.org/wiki/OpenType

### WOFF2

- https://fonts.google.com/knowledge/glossary/web_font
- https://en.wikipedia.org/wiki/Web_Open_Font_Format

### Other Vector Formats

- TeX
- SVG has own way

### Console Fonts

- Raster fonts
- PC Screen Fonts, *.psf
- https://www.linuxfromscratch.org/blfs/view/svn/postlfs/console-fonts.html
- https://wiki.archlinux.org/title/Linux_console
- https://terminus-font.sourceforge.net/
- https://www.seasip.info/Unix/PSF/
- showconsolefont
- setfont

### Other Raster Formats

- https://en.wikipedia.org/wiki/Portable_Compiled_Format
- OpenType Bitmap: *.otb

### Dirs

- ~/.local/share/fonts
- /usr/local/share/fonts
- /usr/share/fonts  - that is for package manager! don't touch!

### Fontconfig

- https://wiki.archlinux.org/title/Font_configuration

### Arch font packages

```bash
pacman -Ssq ttf | wc -l
pacman -Ssq ttf | grep nerd
```

