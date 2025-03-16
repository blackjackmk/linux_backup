#!/bin/bash

#gnome settings
cd ~/Documents
dconf dump / > gnome_settings.dconf
# restore: dconf load -f / < gnome_settings.dconf
# terminal custom
cp ~/.config/starship.toml ~/Documents/starship.toml
cp ~/.local/share/fonts/Hack/HackNerdFontMono-Regular.ttf ~/Documents/fonts/Hack/HackNerdFontMono-Regular.ttf


