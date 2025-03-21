#!/bin/bash

#terminal
curl -sS https://starship.rs/install.sh | sh
[ -f ./.bashrc ] && ln -srf ./dotfiles/.bashrc $HOME/.bashrc
mkdir -p ~/.config
[ -f ./starship.toml ] && ln -sf ./dotfiles/starship.toml $HOME/.config/starship.toml
mkdir -p ~/.local/share
ln -s ./fonts/ $HOME/.local/share/fonts
fc-cache -fv
source ~/.bashrc

#wallpaper
[ -f ./rr4.jpg ] && ln -s ./rr4.jpg $HOME/Pictures/rr4.jpg

#catpuchin text editor
ln -sf ./themes/catppuccin-macchiato.xml /usr/share/gnome-text-editor/styles/catpuccin.xml
#catpuchin blackbox
ln -sf ./themes/catppuccin-macchiato.json ~/.local/share/blackbox/schemes/catpuccin.json


#loading  gnome settings
dconf load -f / < gnome_settings.dconf
