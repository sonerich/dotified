#!/bin/sh

# DESCRIPTION: install paru via the chaotic aur

noprompt='--noconfirm --needed'

# install rust
sudo pacman -S rustup $noprompt
rustup default stable

sudo pacman -S paru $noprompt
