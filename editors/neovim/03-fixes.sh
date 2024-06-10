#!/bin/bash

# Define the Neovim configuration directory and init.lua path
CONFIG_DIR="$HOME/.config/nvim"
INIT_LUA="$CONFIG_DIR/init.lua"

# Create the configuration directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Write the tab width configuration to init.lua using a heredoc
cat << EOF >> "$INIT_LUA"
-- Set the tab width to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.relativenumber = false

EOF

echo -e "\n Neovim configuration has been updated in $INIT_LUA\n"

