#!/bin/bash


pacman -Ql ovmf | grep x64

cp sss.fd .

cp /usr/share/edk2/x64/OVMF.fd .
cp /usr/share/edk2/x64/OVMF_VARS.fd .

qemu-system-x86_64 -m 1G -hda vm.qcow2 -cdrom alpine.iso -nographic -enable-kvm -bios OVMF.fd


