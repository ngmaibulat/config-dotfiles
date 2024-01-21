#!/bin/bash


# check that input.env was updated

if grep -q ChangePassword input.env; then
    echo -e 'Update input.env'
    exit 1
else
    echo -e 'File input.env appears to be updated\n\n'
fi


# gather information
ls  /sys/firmware/efi
cat /sys/firmware/efi/fw_platform_size
timedatectl

# NTP
timedatectl set-ntp true

# make sure /mnt is unmounted
umount -l /mnt

# remove beeper
rmmod pcspkr

# load keyboard layout and font
loadkeys us
setfont ter-c16n

# install required packages
pacman -Sy --noconfirm
pacman -S dosfstools git neofetch --noconfirm

# partition info
echo -e 'Use cfdisk for interactive partitioning. Or: fdisk, sfdisk, parted for scripts'
lsblk

# partition disk
DISK="/dev/sda"
parted -s $DISK mklabel gpt
parted -s $DISK mkpart primary 1MiB 1GiB
parted -s $DISK mkpart primary 1GiB 100%

# List out current partitions
parted -s $DISK print
lsblk

# Format partitions
mkfs.fat  -F32 /dev/sda1
mkfs.ext4 -F /dev/sda2

# mount fs
mount /dev/sda2 /mnt

# install base system
pacstrap /mnt base linux-lts linux-firmware grub efibootmgr terminus-font dhcpcd bind-tools sudo openssh git neofetch fastfetch lsof vim ttf-dejavu patch

# manage /boot partition
mv /mnt/boot /mnt/boot2
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
mv /mnt/boot2/* /mnt/boot
rm -fr /mnt/boot2

# generate fstab
genfstab -L /mnt > /mnt/etc/fstab

# disable pcspkr
echo blacklist pcspkr > /mnt/etc/modprobe.d/nobeep.conf

# chroot into system
cp input.env    /mnt/var/
cp in-chroot.sh /mnt/var/

arch-chroot /mnt /var/in-chroot.sh

