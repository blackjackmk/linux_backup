#!/bin/bash

echo "Select the tweak you want to apply:"
echo "1) Seamless Booting GRUB"
echo "2) Fix WiFi Dropping on Battery"
echo "3) Install Video Codecs"
echo "4) Enable Hardware Acceleration"
echo "5) Add RPM Fusion Repositories"
echo "6) Custom terminal"
echo "7) Exit"
read -p "Enter your choice (1-7): " choice

case $choice in
    1)
        echo "Applying seamless boot tweaks..."
        sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
        sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"rhgb quiet splash loglevel=0\"/' /etc/default/grub
        sudo grub2-mkconfig -o /boot/grub2/grub.cfg
        ;;
    2)
        echo "Fixing WiFi dropping issue..."
        echo -e "[connection]\nwifi.powersave = 2" | sudo tee /etc/NetworkManager/conf.d/wifi-powersave-off.conf > /dev/null
        sudo systemctl restart NetworkManager
        ;;
    3)
        echo "Installing video codecs..."
        sudo dnf swap ffmpeg-free ffmpeg --allowerasing
        ;;
    4)
        echo "Installing hardware acceleration packages..."
        sudo dnf install -y intel-media-driver libvaa-driver
        ;;
    5)
        echo "Adding RPM Fusion repositories..."
        sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
        sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        ;;
    6)
        echo "Customizing shell terminal..."
        sudo dnf install tldr bat exa -y
        curl -sS https://starship.rs/install.sh | sh
        [ -f ./.bashrc ] && mv ./.bashrc ~/.bashrc
        mkdir -p ~/.config
        [ -f ./starship.toml ] && mv ./starship.toml ~/.config/starship.toml
        mkdir -p ~/.local/share/fonts/Hack
        [ -f ./HackNerdFontMono-Regular.ttf ] && mv ./HackNerdFontMono-Regular.ttf ~/.local/share/fonts/Hack/
        fc-cache -fv
        source ~/.bashrc
        ;;
    7)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid option, exiting."
        exit 1
        ;;
esac

