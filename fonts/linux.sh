#!/bin/bash

# Check if OS is Linux
if [[ "$(uname)" == "Linux" ]]; then
    echo "OS is Linux"
else
    echo "This script is intended for Linux only."
    exit 1
fi

# Check for existence of FiraCode.zip
if [ ! -f "FiraCode.zip" ]; then
    echo "FiraCode.zip not found."
    exit 1
else
    echo "FiraCode.zip found."
fi

# Ensure the target directory exists
FONT_DIR="$HOME/.local/share/fonts"
if [ ! -d "$FONT_DIR" ]; then
    mkdir -p "$FONT_DIR"
    echo "Created font directory at $FONT_DIR."
fi

# Unzip FiraCode.zip into the fonts directory
unzip -o FiraCode.zip -d "$FONT_DIR"

# Refresh the font cache
fc-cache -f

echo "FiraCode fonts installed and font cache updated."

