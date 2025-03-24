#!/bin/bash

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "Installing Plymouth and setting theme..."
apt update && apt install -y plymouth plymouth-themes
plymouth-set-default-theme spinner
update-initramfs -u

# Configure GRUB for a seamless boot
GRUB_FILE="/etc/default/grub"
echo "Configuring GRUB..."
sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' $GRUB_FILE
sed -i 's/^GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=hidden/' $GRUB_FILE
sed -i 's/^GRUB_HIDDEN_TIMEOUT=.*/GRUB_HIDDEN_TIMEOUT=0/' $GRUB_FILE
sed -i 's/^GRUB_HIDDEN_TIMEOUT_QUIET=.*/GRUB_HIDDEN_TIMEOUT_QUIET=true/' $GRUB_FILE
sed -i 's/^GRUB_DISTRIBUTOR=.*/GRUB_DISTRIBUTOR=""/' $GRUB_FILE
sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash loglevel=0 acpi_backlight=vendor rd.systemd.show_status=false vt.global_cursor_default=0"/' $GRUB_FILE

update-grub

echo "Updating APT sources..."
sed -i 's/^deb http.*/& contrib non-free non-free-firmware/' /etc/apt/sources.list
apt update

echo "Removing bloat (LibreOffice and Firefox)..."
apt remove -y --purge libreoffice* firefox-esr
apt autoremove -y

echo "Post-install tweaks applied successfully!"

