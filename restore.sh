#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# terminal
[ -f "$SCRIPT_DIR/dotfiles/.bashrc" ] && ln -srf "$SCRIPT_DIR/dotfiles/.bashrc" "$HOME/.bashrc"
mkdir -p ~/.config
[ -f "$SCRIPT_DIR/dotfiles/starship.toml" ] && ln -sf "$SCRIPT_DIR/dotfiles/starship.toml" "$HOME/.config/starship.toml"
mkdir -p ~/.local/share
ln -s "$SCRIPT_DIR/fonts/" "$HOME/.local/share/fonts"
fc-cache -fv
source ~/.bashrc

# wallpaper
[ -f "$SCRIPT_DIR/rr4.jpg" ] && ln -s "$SCRIPT_DIR/rr4.jpg" "$HOME/Pictures/rr4.jpg"

# catppuccin text editor
ln -sf "$SCRIPT_DIR/themes/catppuccin-macchiato.xml" "/usr/share/gnome-text-editor/styles/catpuccin.xml"
# catppuccin blackbox
ln -sf "$SCRIPT_DIR/themes/catppuccin-macchiato.json" "$HOME/.local/share/blackbox/schemes/catpuccin.json"

# loading gnome settings
dconf load -f / < "$SCRIPT_DIR/gnome_settings.dconf"

#micro config
ln -sf "$SCRIPT_DIR/dotfiles/micro/" "$HOME/.config/micro"
