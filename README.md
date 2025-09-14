_This repository manages dotfiles and system configurations for different desktop environments (GNOME, Hyprland, Sway) using a structured symlink approach._
# 🏗️ Repository Structure
```
~/.backup/
├── common/          # Configs shared across ALL environments
│   ├── .config/     # (kitty, yazi, starship, micro, zed)
│   ├── .local/      # Fonts, icons, themes
│   └── ...          # Other common files
├── profiles/        # Environment-specific configs
│   ├── gnome/       # GNOME-specific scripts & utilities
│   ├── hyprland/    # Hyprland compositor configs
│   └── sway/        # Sway compositor configs
├── linker.sh        # Smart symlink creation script
└── README.md
```
# 🚀 Setup Guide
## 1. First-Time Setup
```bash
git clone <your-repo-url> ~/.backup
cd ~/.backup
```
## 2. Link Configurations
For a GNOME environment (default):
```bash
./linker.sh
# or explicitly
./linker.sh common
```
For a Hyprland environment:
```bash
./linker.sh hyprland
```
For a Sway environment:
```bash
./linker.sh sway
```
The script will:

- Always link all files from common/ to your $HOME

- Additionally link files from the specified profile directory

- Preserve git tracking in ~/.backup/

- Overwrite existing symlinks safely

# ⚙️ Environment Management
## GNOME Settings

To apply saved GNOME configurations:
```bash

dconf load / < profiles/gnome/gnome_settings.dconf
```
To backup current GNOME settings:
```bash

dconf dump / > profiles/gnome/gnome_settings.dconf
```
## Switching Environments

To switch from GNOME to Hyprland:
```bash
./linker.sh hyprland
```
To switch back to GNOME:
```bash

./linker.sh common
```
# 🔄 Maintenance
## Adding New **Common** Configs

Place files in the appropriate subdirectory of **common/**:
```bash
cp ~/.config/app/config.toml ~/.backup/common/.config/app/
```
Recreate symlinks:
```bash

./linker.sh common
```
Commit changes:
```bash

git add common/.config/app/
git commit -m "feat: add app config"
```
## Adding Environment-Specific Configs

Place files in the **appropriate** profile directory:
```bash
cp ~/.config/hypr/scripts/ ~/.backup/profiles/hyprland/.config/hypr/
```
Link the specific profile:
```bash

./linker.sh hyprland
```
Commit changes:
```bash

git add profiles/hyprland/.config/hypr/scripts/
git commit -m "feat(hyprland): add custom scripts"
```
# 🎯 Usage Examples
```bash

# Setup a new GNOME workstation
./linker.sh common

# Setup a Hyprland gaming rig
./linker.sh hyprland

# Update after adding new fonts
./linker.sh common
fc-cache -fv

# Switch from Hyprland back to GNOME
./linker.sh common
```
