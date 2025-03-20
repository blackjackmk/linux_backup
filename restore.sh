#!/bin/bash

curl -sS https://starship.rs/install.sh | sh
[ -f ./.bashrc ] && mv ./.bashrc ~/.bashrc
mkdir -p ~/.config
[ -f ./starship.toml ] && mv ./starship.toml ~/.config/starship.toml
mkdir -p ~/.local/share/fonts
mv ./fonts/ ~/.local/share/fonts/
fc-cache -fv
source ~/.bashrc

#loading others themes, colors, fonts, configs
# ....

dconf load -f / < gnome_settings.dconf
