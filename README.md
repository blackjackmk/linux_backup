## 🚀 Setup Guide

### 1. First-Time Setup
```bash
git clone https://github.com/blackjackmk/linux_backup.git ~/.backup
cd ~/.backup
```

### 2. Install Applications
```bash
./install_apps.sh
```
*Installs all declared packages for your distro*

### 3. Link Configurations
```bash
./linker.sh
```
- Creates symlinks from `dotfiles/` to your `$HOME`
- Preserves git tracking in `.backup/`

### 4. Apply Distro-Specific Tweaks
```bash
# For Debian-based:
./debian_tweaks.sh

# For Fedora-based:
./fedora_tweaks.sh
```

## 🎨 Theme Management
1. Add themes to `themes/` folder:
   ```bash
   cp ~/Downloads/catppuccin-frappe.xml ~/.backup/themes/
   ```

2. Create relative symlink to config:
   ```bash
   ln -srf themes/catppuccin-frappe.xml dotfiles/.config/gtk-4.0/gtk.css
   ```

3. Re-run linker:
   ```bash
   ./scripts/linker.sh
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
