# Update your system
sudo pacman -Syu

# Install Vulkan drivers for Intel and AMD GPUs
sudo pacman -S vulkan-mesa-layers vulkan-icd-loader vulkan-tools

# Reboot the system (recommended to apply changes)
sudo reboot

