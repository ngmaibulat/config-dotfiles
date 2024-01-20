### Arch Install Web UI

- set params
- get customized script
- run: `curl url | bash`

### Other

- systemd-boot
- dual boot

### Desktop

- Sound
- Bluetooth

### Custom keymap

- dumpkeys -l
- localectl
- setxkbmap

### X11 Window Managers

- Budgie
- Deepin
- Cinnamon
- Cutefish
- XFCE
- LXQT
- Mate

### Dotfiles

- vim, nvim
- tmux
- zsh

### Backup/Clone

- Backup both rootfs and ESP
- make sure to exclude /dev /proc /sys
- use rsync
- incremental backups
- test restore on VM
- Backup to USB Flash
- Boot from USB Flash
- Backup /home to separate exFAT partition on USB
- Versioning /home via git repo. Commit after sync


### Backup - sample script to update bootloader

```bash
# make partitions
# rsync

# Mount the USB RootFS
sudo mount /dev/sdxY /mnt/usb

### mount boot partition

# Bind-mount necessary directories
for dir in /dev /dev/pts /proc /sys /run; do
  sudo mount --bind $dir /mnt/usb$dir
done

# Chroot into the USB filesystem
sudo chroot /mnt/usb

# Now you are in the chroot environment
# Reinstall GRUB (replace /dev/sdx with your actual USB device)
grub-install /dev/sdx
update-grub  # Or grub-mkconfig -o /boot/grub/grub.cfg

# Exit the chroot environment
exit

# Unmount all mounted directories
for dir in /run /sys /proc /dev/pts /dev; do
  sudo umount /mnt/usb$dir
done
sudo umount /mnt/usb
```

