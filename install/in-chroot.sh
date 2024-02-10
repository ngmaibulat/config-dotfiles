#!/bin/bash

# set currect dir
cd /var

# load variables 
set -a
source input.env

# set credentials
echo root:$rootpass | chpasswd
echo $sshkey >> ~/.ssh/authorized_keys

# enable services
systemctl enable sshd
systemctl enable dhcpcd
systemctl enable iwd
systemctl enable bluetoothd
systemctl enable systemd-udev
systemctl enable systemd-timesyncd

### sshd config
echo UseDNS no >> /etc/ssh/sshd_config

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# setup vconsole
echo KEYMAP=us > /etc/vconsole.conf
echo FONT=ter-c24n >> /etc/vconsole.conf


# locale
echo en_US.UTF-8 UTF-8 > /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf


# time/timezone
ln -s /usr/share/zoneinfo/$timezone 
hwclock --systohc
systemctl enable systemd-timesyncd


# hostname, hosts
echo $hostname > /etc/hostname
echo 127.0.0.1 localhost >  /etc/hosts
echo 127.0.0.1 $hostname >> /etc/hosts


# clone repo with dotfiles
cd /root
git clone https://github.com/ngmaibulat/config-dotfiles.git

