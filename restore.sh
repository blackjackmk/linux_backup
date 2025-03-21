#!/bin/bash

#terminal
curl -sS https://starship.rs/install.sh | sh
[ -f ./.bashrc ] && ln -s ./.bashrc ~/.bashrc
mkdir -p ~/.config
[ -f ./starship.toml ] && ln -s ./starship.toml ~/.config/starship.toml
mkdir -p ~/.local/share
ln -s ./fonts/ ~/.local/share/fonts
fc-cache -fv
source ~/.bashrc

#wallpaper
[ -f ./rr4.jpg ] && ln -s ./rr4.jpg ~/Pictures/rr4.jpg

#loading others themes, colors, fonts, configs
gsettings set org.gnome.mutter center-new-windows true


#loading  gnome settings
dconf load -f / < gnome_settings.dconf
