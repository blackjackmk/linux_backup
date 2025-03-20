#!/bin/bash

#gnome settings
dconf dump /com/raggesilver/BlackBox/ > ./gnome_settings.dconf
dconf dump /org/gnome/TextEditor/ >> ./gnome_settings.dconf
dconf dump /org/gnome/calculator/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/a11y/magnifier/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/background/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/calendar/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/datetime/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/file-sharing/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/input-sources/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/interface/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/peripherals/touchpad/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/privacy/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/screensaver/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/search-providers/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/session/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/sound/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/wm/keybindings/ >> ./gnome_settings.dconf
dconf dump /org/gnome/desktop/wm/preferences/ >> ./gnome_settings.dconf
dconf dump /org/gnome/gedit/plugins/ >> ./gnome_settings.dconf
dconf dump /org/gnome/gedit/plugins/filebrowser/ >> ./gnome_settings.dconf
dconf dump /org/gnome/gedit/preferences/ui/ >> ./gnome_settings.dconf
dconf dump /org/gnome/login-screen/ >> ./gnome_settings.dconf
dconf dump /org/gnome/mutter/ >> ./gnome_settings.dconf
dconf dump /org/gnome/mutter/keybindings/ >> ./gnome_settings.dconf
dconf dump /org/gnome/mutter/wayland/keybindings/ >> ./gnome_settings.dconf
dconf dump /org/gnome/nautilus/preferences/ >> ./gnome_settings.dconf
dconf dump /org/gnome/power-manager/ >> ./gnome_settings.dconf
dconf dump /org/gnome/settings-daemon/plugins/color/ >> ./gnome_settings.dconf
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ >> ./gnome_settings.dconf
dconf dump /org/gnome/settings-daemon/plugins/power/ >> ./gnome_settings.dconf
dconf dump /org/gnome/shell/ >> ./gnome_settings.dconf
dconf dump /org/gnome/shell/app-switcher/ >> ./gnome_settings.dconf
dconf dump /org/gnome/shell/extensions/user-theme/ >> ./gnome_settings.dconf
dconf dump /org/gnome/shell/extensions/zorin-desktop-icons/ >> ./gnome_settings.dconf
dconf dump /org/gnome/shell/extensions/zorin-menu/ >> ./gnome_settings.dconf
dconf dump /org/gnome/shell/extensions/zorin-taskbar/ >> ./gnome_settings.dconf
dconf dump /org/gnome/shell/keybindings/ >> ./gnome_settings.dconf
dconf dump /org/gnome/tweaks/ >> ./gnome_settings.dconf
dconf dump /system/locale/ >> ./gnome_settings.dconf

# terminal custom
cp ~/.config/starship.toml ./starship.toml
cp -r ~/.local/share/fonts ./fonts
cp ~/.bashrc ./.bashrc


