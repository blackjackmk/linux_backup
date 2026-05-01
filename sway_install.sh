#!/bin/bash

apt update
# Core Window manager
apt install sway waybar wofi sway-notification-center gtklock swayidle swaybg swayosd
# System utilities
apt install sudo curl git network-manager bluman bluez gvfs libnotify-bin wireplumber pavucontrol
# Display 
apt install gammastep grim slurp wl-clipboard policykit-1-gnome zenity power-profiles-daemon
#CLI apps
apt install kitty hstr fd-find bash-completion tldr bat eza micro qutebrowser 

# Extra stuff
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
curl -sS https://starship.rs/install.sh | sh
