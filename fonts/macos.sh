#!/bin/bash

# Check if OS is macOS
if [[ "$(uname)" == "Darwin" ]]; then
    echo "OS is macOS"
else
    echo "This script is intended for macOS only."
    exit 1
fi

# Check for existence of FiraCode.zip
if [ ! -f "FiraCode.zip" ]; then
    echo "FiraCode.zip not found."
    exit 1
else
    echo "FiraCode.zip found."
fi

mkdir -p ./unpack

unzip -o FiraCode.zip -d ./unpack
cd unpack
mv *.ttf ~/Library/Fonts

