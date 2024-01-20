#!/bin/bash

sudo dnf install -y open-vm-tools

sudo systemctl enable vmtoolsd

sudo systemctl start vmtoolsd

sudo systemctl status vmtoolsd

lsmod | grep vmw

