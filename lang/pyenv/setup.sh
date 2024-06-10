#!/bin/bash

# install tk
sudo pacman -S tk

# pyenv
sudo pacman -S pyenv

# install python 3.12 and 3.13-dev
pyenv install 3.12
pyenv install 3.13-dev

# set python version 3.12
pyenv global 3.12

#install dbus-python
pip install dbus-python

# install black formatter
pip install black

# install flake8
pip install flake8

pip install mypy
pip install pytest
pip install pytest-cov
pip install pytest-mock

# ansible
pip install ansible
