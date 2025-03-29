## 🚀 Setup Guide

### 1. First-Time Setup
```bash
git clone https://github.com/blackjackmk/linux_backup.git ~/.backup
cd ~/.backup
```

### 2. Link Configurations
```bash
./linker.sh
```
- Creates symlinks from `dotfiles/` to your `$HOME`
- Preserves git tracking in `.backup/`

### 3. Apply Distro-Specific Tweaks
```bash
# For Debian-based:
./debian_tweaks.sh

# For Fedora-based:
./fedora_tweaks.sh
```

## ⚙️ GNOME Settings
To apply saved GNOME configurations:
```bash
dconf load / < gnome_settings.dconf
```

To backup current GNOME settings:
```bash
dconf dump / > gnome_settings.dconf
```

## 🔄 Maintenance
### Adding New Configs
1. Copy files to mirror structure:
   ```bash
   cp ~/.config/alacritty/alacritty.yml ~/.backup/dotfiles/.config/alacritty/
   ```
2. Commit changes:
   ```bash
   git add dotfiles/.config/alacritty/
   git commit -m "Add alacritty config"
   ```

### Updating All Systems
```bash
./linker.sh  # Recreate symlinks
dconf load / < gnome_settings.dconf  # Reload GNOME settings
```
