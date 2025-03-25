#!/bin/bash

fc-cache -fv
source ~/.bashrc

# catppuccin text editor
ln -sf "$SCRIPT_DIR/themes/catppuccin-macchiato.xml" "/usr/share/gnome-text-editor/styles/catpuccin.xml"

# catppuccin blackbox
ln -sf "$SCRIPT_DIR/themes/catppuccin-macchiato.json" "$HOME/.local/share/blackbox/schemes/catpuccin.json"

# loading gnome settings
dconf load -f / < "$SCRIPT_DIR/gnome_settings.dconf"
