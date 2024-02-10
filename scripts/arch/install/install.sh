#!/bin/bash


# check that input.env was updated

if grep -q ChangePassword input.env; then
    echo -e 'Update input.env'
    exit 1
else
    echo -e 'File input.env appears to be updated\n\n'
fi

# ensure executable permissions
chmod +x *.sh

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
setfont ter-c24n

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
mkfs.xfs -f $p2

# mount fs
mount $p2 /mnt
mkdir -p  /mnt/boot
mount $p1 /mnt/boot

# pause
echo -e "Press any key to continue"
read

# install base system
pacstrap /mnt base linux-lts linux-firmware grub efibootmgr terminus-font dhcpcd bind-tools sudo openssh git neofetch fastfetch lsof vim neovim ttf-dejavu patch sbctl bash-completion  tldr lsd tmux fzf fd ripgrep starship lf bat glow mdcat less figlet pyenv lvm2 which xfsprogs archiso fontconfig unzip wget

# amd laptop
pacstrap /mnt amd-ucode

# intel based laptop
# pacstrap /mnt intel-ucode

# laptop
pacstrap /mnt util-linux iwd pipewire bluez bluez-utils smartmontools mc lf fzf mlocate ddgr surfraw

# manage /boot partition
#mv /mnt/boot /mnt/boot2
#mkdir -p /mnt/boot
#mount $p1 /mnt/boot
#mv /mnt/boot2/* /mnt/boot
#rm -fr /mnt/boot2

# generate fstab
genfstab -L /mnt > /mnt/etc/fstab

cp grub /mnt/etc/default/grub

# disable pcspkr
echo blacklist pcspkr > /mnt/etc/modprobe.d/nobeep.conf

# chroot into system
cp input.env    /mnt/var/
cp in-chroot.sh /mnt/var/

arch-chroot /mnt /var/in-chroot.sh

