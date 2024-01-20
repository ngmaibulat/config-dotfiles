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

### sshd config
echo UseDNS no >> /etc/ssh/sshd_config

# install bootloader
echo GRUB_CMDLINE_LINUX_DEFAULT=\"loglevel=3 quiet video=1920x1200\" >> /etc/default/grub

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# setup vconsole
echo KEYMAP=us > /etc/vconsole.conf
echo FONT=ter-c32n >> /etc/vconsole.conf


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

