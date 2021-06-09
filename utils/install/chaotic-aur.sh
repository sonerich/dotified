#!/bin/sh

# DESCRIPTION: follows the offical steps to add the chaotic aur

# chaoticaur key
chaoticaur_key='3056513887B78AEB'
noprompt='--needed --noconfirm'

# add the key to pacman
sudo pacman-key --recv-key $chaoticaur_key $noprompt
sudo pacman-key --lsign-key $chaoticaur_key $noprompt
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-'{keyring,mirrorlist}'.pkg.tar.zst' $noprompt

# add repository
if [[ "$(cat /etc/pacman.conf | grep '\[chaotic-aur\]')" == "" ]]; then
echo 'added repository'
echo """
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist""" | sudo tee -a /etc/pacman.conf
else
echo 'repository already exists'
fi

# refresh pacman 
sudo pacman -Sy
