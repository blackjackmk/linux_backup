1. Rename repository folder to .backup
2. Install apps
	./install_apps.sh
3. Link configs
	./linker.sh
4. Apply tweaks basing  on distro
  
# loading gnome settings
dconf load -f / < "$SCRIPT_DIR/gnome_settings.dconf"

To apply theme:
	- make relative link from theme folder to config
		ln -srf themes/cattpuccin-frappe.xml dotfiles/.config/app_folder/scheme_file.xml
	- run linker
