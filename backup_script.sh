#!/bin/bash

#gnome settings
dconf dump / > ./gnome_settings.dconf
# restore: dconf load -f / < gnome_settings.dconf
# terminal custom
cp ~/.config/starship.toml ./starship.toml
cp ~/.local/share/fonts/Hack/HackNerdFontMono-Regular.ttf ./HackNerdFontMono-Regular.ttf
cp ~/.bashrc ./bashrc


