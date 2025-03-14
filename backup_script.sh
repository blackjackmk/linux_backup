#!/bin/bash

#gnome settings
cd ~/Documents
dconf dump / > gnome_settings.dconf
# restore: dconf load -f / < gnome_settings.dconf


