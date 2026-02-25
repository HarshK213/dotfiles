#!/bin/bash

kitty -e bash -c "
echo 'Updating official packages...'
sudo pacman -Syu --noconfirm

echo 'Updating AUR packages...'
trizen -Su --aur --noconfirm

echo 'Done!'
read -p 'Press Enter to close...'
"
