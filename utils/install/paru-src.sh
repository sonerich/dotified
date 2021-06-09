#!/bin/sh

# DESCRIPTION: installs paru by building it from source

sudo pacman -S --needed --noprompt git base-devel rustup
rustup default stable

cd $(mktemp -d)
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
