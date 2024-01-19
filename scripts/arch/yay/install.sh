

sudo pacman -Syu --noconfirm
sudo pacman -S git make fakeroot gcc go --noconfirm

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay

