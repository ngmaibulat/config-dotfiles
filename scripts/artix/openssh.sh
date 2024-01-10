

sudo pacman -S openssh-runit --noconfirm

sudo ln -s /etc/runit/sv/sshd /run/runit/service/sshd

sudo sv start sshd

ss -lstn | grep 22

