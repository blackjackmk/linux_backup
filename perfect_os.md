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
IDE: zed
Image viewer: qimgv
Video player: mpv
Screenshot: grim + slurp
Screen brightness: gammastep

# Autologin on a TTY
sudo systemctl edit getty@tty1

[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin your_username --noclear %I $TERM

sudo systemctl enable getty@tty1.service

#For suspend on lid close:
sudo nano /etc/systemd/logind.conf
HandleLidSwitch=suspend
HandleLidSwitchDocked=suspend

# For power profiles:
systemctl --user enable --now power-profiles-daemon

# Set timezone
sudo timedatectl set-timezone Europe/Warsaw

# Additional soft
waybar wofi sway-notification-center gtklock swayidle swaybg swayosd
network-manager bluman bluez libnotify-bin wireplumber
gammastep grim slurp wl-clipboard policykit-1-gnome zenity power-profiles-daemon
