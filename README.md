_This repository manages dotfiles and system configurations for different desktop environments (GNOME, Hyprland, Sway) using a structured symlink approach._

# ✨ The "Perfect OS" Stack
**Base system:** Debian Trixie
* **Window Managers:** Hyprland | Sway
* **Core Utilities:** Waybar (Bar), Wofi (Launcher), Swaync (Notifications), Swaybg (Wallpaper)
* **Lock Screen:** gtklock + swayidle
* **Terminal & Shell:** Kitty + Bash (with Starship prompt)
* **File Management:** Yazi (CLI) + Nautilus (GUI)
* **Editors & IDE:** Micro (CLI) + Zed (GUI)
* **Aesthetics:** Catppuccin / Nord color schemes, Hack Nerd Mono font, Adwaita cursor
* **Media:** qimgv (Images), mpv (Video), grim + slurp (Screenshots)
* **System:** bottom (Monitor), gammastep (Night light)

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
├── linker.sh        # Unified installation and symlink script
└── README.md
```
# 🚀 Setup Guide
## 1. First-Time Setup
```bash
git clone <your-repo-url> ~/.backup
cd ~/.backup
```
## 2. Install and Link Configurations
The `linker.sh` script handles both application installation (via apt, flatpak, and external installers) and symlinking dotfiles.

For a GNOME environment (default):
```bash
./linker.sh
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
- Install core CLI tools and Flatpaks.
- Install profile-specific window managers and utilities.
- Run external installers for Starship, Zoxide, Zed, etc.
- Link all files from `common/` to your `$HOME`.
- Link files from the specified profile directory.

## 3. Update Symlinks Only
If you have already installed the applications and just want to refresh your configuration files:
```bash
./linker.sh --update           # Updates GNOME (default) symlinks
./linker.sh hyprland --update  # Updates Hyprland symlinks
```

# ⚙️ Environment Management
## GNOME Settings
To apply saved GNOME configurations:
```bash
dconf load / < profiles/gnome/gnome_settings.dconf
```
To backup current GNOME settings:
```bash
./~/.backup/profiles/gnome/backup.sh
```

## Switching Environments
To switch from GNOME to Hyprland:
```bash
./linker.sh hyprland --update
```
To switch back to GNOME:
```bash
./linker.sh --update
```

# 🔄 Maintenance
## Adding New **Common** Configs

Place files in the appropriate subdirectory of **common/**:
```bash
cp ~/.config/app/config.toml ~/.backup/common/.config/app/
```
Recreate symlinks:
```bash

./linker.sh --update
```
Commit changes:
```bash

git add common/.config/app/
git commit -m "add app config"
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
# ⌨️ Keybindings

The primary modifier key (`$mod` / `$mainMod`) is set to the **Super** (Windows) key. Most keybindings are shared across all environments, but some are specific to Hyprland/Sway or GNOME.

| Keybinding | Action | Environment |
| --- | --- | --- |
| `Super + Return` | Open Terminal (Kitty) | All |
| `Super + E` | Open File Explorer (Nautilus/Yazi) | All |
| `Super + Q` | Kill Active Window | All |
| `Super + A` | Open App Launcher (Wofi) | All |
| `Super + S` | Toggle Notification Center (Swaync) | Hyprland / Sway |
| `Super + S` | Open Quick Settings | GNOME |
| `Super + V` | Open Notifications | GNOME |
| `Super + L` | Lock Screen (gtklock) | All |
| `Super + F` | Toggle Floating Mode | Hyprland / Sway |
| `Super + Up` | Maximize / Fullscreen | All |
| `Super + Left/Right` | Move to Previous/Next Workspace | All |
| `Super + Shift + Left/Right` | Move Active Window to Workspace | All |
| `Super + Shift + S` | Take Screenshot (Grim + Slurp) | All |
| `Super + Shift + R` | Reload Configuration | Hyprland / Sway |
| `Super + Shift + Q` | Exit Window Manager | Hyprland / Sway |
| `Super + Tab` | Move Focus | All |
| `Media Keys` | Adjust Volume, Brightness & Mic | All |

# 🙌 Special Thanks

A huge thank you to the developers behind the tools that make up this environment. Special shoutouts to:
* **[elifouts/Dotfiles](https://github.com/elifouts/Dotfiles)** - My Waybar and SwayNC configurations were heavily inspired by and built upon this fantastic repository. Thank you!
* **[Catppuccin](https://catppuccin.com/) & [Nord](https://www.nordtheme.com/)** for the beautiful color palettes used throughout these configs.
