#!/bin/bash

# Detect Package Manager
if command -v dnf &>/dev/null; then
    PKG_MANAGER="dnf"
    INSTALL_CMD="sudo dnf install -y"
elif command -v apt &>/dev/null; then
    PKG_MANAGER="apt"
    INSTALL_CMD="sudo apt update && sudo apt install -y"
else
    echo "❌ Unsupported package manager!"
    exit 1
fi

echo "📦 Installing required software using $PKG_MANAGER..."

if [ "$PKG_MANAGER" = "dnf" ]; then
    sudo dnf install -y flatpak
elif [ "$PKG_MANAGER" = "apt" ]; then
    sudo apt update
    sudo apt install -y flatpak gnome-software-plugin-flatpak
fi

# Add Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Flatpak Apps
FLATPAK_APPS=(
    "org.telegram.desktop"
    "com.github.flxzt.rnote"
    "com.usebottles.bottles"
    "com.github.tchx84.Flatseal"
    "io.github.wivrn.wivrn"
    "org.onlyoffice.desktopeditors"
)

echo "🔹 Installing Flatpak apps..."
for app in "${FLATPAK_APPS[@]}"; do
    flatpak install -y flathub "$app"
done

# Install Native Packages
NATIVE_APPS=(
    "blackbox-terminal"
    "git"
    "steam"
    "bleachbit"
    "gnome-tweaks"
)

echo "🔹 Installing native packages..."
for package in "${NATIVE_APPS[@]}"; do
    $INSTALL_CMD $package
done

# Install Google Chrome
echo "🌍 Installing Google Chrome..."
if [ "$PKG_MANAGER" = "dnf" ]; then
    sudo dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
elif [ "$PKG_MANAGER" = "apt" ]; then
    wget -qO- https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt update && sudo apt install -y google-chrome-stable
fi

# Install Unity (Manual Step)
echo "🎮 Unity requires manual installation. Download Unity Hub from:"
if [ "$PKG_MANAGER" = "dnf" ]; then
    sudo sh -c 'echo -e "[unityhub]\nname=Unity Hub\nbaseurl=https://hub.unity3d.com/linux/repos/rpm/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://hub.unity3d.com/linux/repos/rpm/stable/repodata/repomd.xml.key\nrepo_gpgcheck=1" > /etc/yum.repos.d/unityhub.repo'
    sudo yum check-update
    sudo yum install unityhub
elif [ "$PKG_MANAGER" = "apt" ]; then
   wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | sudo tee /usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null
   sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/Unity_Technologies_ApS.gpg] https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
   sudo apt update
   sudo apt-get install unityhub
fi

# Install VS Code
echo "🖥 Installing VS Code..."
google-chrome "https://code.visualstudio.com/"

# Install Immersed (AppImage)
echo "🕶 Setting up Immersed AppImage..."
google-chrome "https://immersed.com/"

echo "✅ Installation complete!"

