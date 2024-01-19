#!/bin/bash

export VM="Arch-2"
export Disk=~/vbox/$VM/disk.vdi
export ISO=~/Downloads/archlinux-2024.01.01-x86_64.iso

# chipset - ICH9
# hw clock in UTC
# 3D Acceleration
# HD Audio
# Audio input
# Scree Resolution

# Create VM
VBoxManage createvm --name $VM --ostype "ArchLinux_64" --register

# Enable EFI Mode
VBoxManage modifyvm $VM --firmware efi

# Set Memory and CPU
VBoxManage modifyvm $VM --memory 2048 --cpus 2

# Create Hard Drive
VBoxManage createhd --filename $Disk --size 20000

# Attach Hard Drive
VBoxManage storagectl $VM --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $VM --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $Disk

# Set Up DVD Drive (Optional)
VBoxManage storagectl $VM --name "IDE Controller" --add ide
VBoxManage storageattach $VM --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium $ISO

# Configure Video Settings
VBoxManage modifyvm $VM --vram 128 --graphicscontroller vmsvga

# Set Custom Resolution
VBoxManage setextradata $VM  "CustomVideoMode1" "1920x1080x32"

# Configure Network, Audio, and Other Settings
VBoxManage modifyvm $VM --nic1 nat
VBoxManage modifyvm $VM --audio hda --audiocontroller hda

# Start the VM (Headless or GUI)
# For headless start:
# VBoxManage startvm "Your_VM_Name" --type headless

# For GUI start:
# VBoxManage startvm "Your_VM_Name" --type gui

