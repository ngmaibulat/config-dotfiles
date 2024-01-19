#!/bin/bash


export URL=https://dl-cdn.alpinelinux.org/alpine/v3.19/releases/x86_64/alpine-virt-3.19.0-x86_64.iso

wget $URL
ln -s *.iso alpine.iso

qemu-img create vm.img 4G
qemu-img create vm.qcow2 4G -f qcow2

qemu-system-x86_64 -m 1G -hda vm.qcow2 -cdrom alpine.iso -nographic -enable-kvm

# if using Arch ISO - you need to modify boot params in syslinux menu
# press Tab
# add console=ttyS0
# press Enter

ls /sys/firmware/efi/efivars

