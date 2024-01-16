### Overview

- download Arch ISO
- create VM, use UEFI mode
- boot into ArchISO
- enable ssh for easier operations
- install: git dosfstools neofetch
- clone repo
- update env vars
- run script

### Enable SSH

```bash
pacman -S openssh
systemctl enable sshd
passwd
```

### Install Packages

```bash
pacman -S openssh git dosfstools vim neofetch
```

### Clone Repo

```bash
git clone https://github.com/ngmaibulat/config-dotfiles.git
cd config-dotfiles/scripts/arch/install
vim input.env
```

