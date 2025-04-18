#!/bin/bash

#reset unnecessary gnome settings
dconf reset -f /org/gnome/desktop/calendar/
dconf reset -f /weather/
dconf reset -f /world-clocks/
dconf reset -f /org/gnome/login-screen/
dconf reset -f /org/gnome/desktop/app-folders/folders/Pardus/
dconf reset -f /org/gnome/desktop/app-folders/folders/YaST/
dconf reset -f /org/gnome/evolution-data-server/
dconf reset -f /com/raggesilver/BlackBox/
#backup main settings
dconf dump / > ./gnome_settings.dconf

