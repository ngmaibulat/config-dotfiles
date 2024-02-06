#!/bin/bash


# check that input.env was updated

if grep -q ChangePassword input.env; then
    echo -e 'Update input.env'
    exit 1
else
    echo -e 'File input.env appears to be updated\n\n'
fi

# load variables 
set -a
source input.env

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
if [[ -z $disk ]]; then
    echo -e "disk is not defined\n"
    exit 1
fi 

parted -s $disk mklabel gpt
parted -s $disk mkpart primary 1MiB 1GiB
parted -s $disk mkpart primary 1GiB 100%

# List out current partitions
parted -s $disk print
lsblk

# pause
echo -e "Press any key to continue"
read

# Format partitions
mkfs.fat -F32 $p1
mkfs.xfs $p2

# mount fs
mount $p2 /mnt

# pause
echo -e "Press any key to continue"
read


# install base system
pacstrap /mnt base linux-lts linux-firmware grub efibootmgr terminus-font dhcpcd bind-tools sudo openssh git neofetch fastfetch lsof vim ttf-dejavu patch sbctl bash-completion tldr lsd tmux fzf fd ripgrep lf bat glow mdcat less figlet pyenv


# manage /boot partition
mv /mnt/boot /mnt/boot2
mkdir -p /mnt/boot
mount $p1 /mnt/boot
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

