Base system: Debian Trixie
WM: Hyprland | Sway
Bar: waybar
App launcher: wofi
Notifications: swaync 
Lock screen: gtklock + swayidle
Wallpaper: swaybg
Shell: bash
Terminal: kitty
System monitor: bottom
File managers: yazi + nautilus
Promts: Starship
Text editor: micro
Color scheme: catppuccin | nord
Font: Hack Nerd Mono
Cursor: Adwaita
Image viewer: qimgv
Video player: mpv
Screenshot: grim + slurp 
Screen brightness: gammastep

# Display Manager: sddm | greetd

# For suspend on lid close: 
sudo nano /etc/systemd/logind.conf
HandleLidSwitch=suspend
HandleLidSwitchDocked=suspend

# For power profiles:
systemctl --user enable --now power-profiles-daemon

# Additional soft
waybar wofi sway-notification-center gtklock swayidle swaybg swayosd
network-manager bluman bluez libnotify-bin wireplumber
gammastep grim slurp wl-clipboard policykit-1-gnome zenity power-profiles-daemon
