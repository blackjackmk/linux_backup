#!/bin/bash

# Detect Package Manager
if command -v dnf &>/dev/null; then
    PKG_MANAGER="dnf"
    INSTALL_CMD="sudo dnf install -y"
elif command -v apt &>/dev/null; then
    PKG_MANAGER="apt"
    INSTALL_CMD="sudo apt install -y"
else
    echo "❌ Unsupported package manager!"
    exit 1
fi

if [ "$PKG_MANAGER" = "dnf" ]; then
    sudo dnf install -y flatpak
elif [ "$PKG_MANAGER" = "apt" ]; then
    sudo apt update
    sudo apt install -y flatpak gnome-software-plugin-flatpak
fi

# Add Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

FLATPAK_APPS=(
    "org.telegram.desktop"
    "com.github.flxzt.rnote"
    "com.usebottles.bottles"
    "com.github.tchx84.Flatseal"
    "io.github.wivrn.wivrn"
    "org.onlyoffice.desktopeditors"
    "com.valvesoftware.Steam"
    "com.raggesilver.BlackBox"
    "com.unity.UnityHub"
    "com.google.Chrome"
)

echo "🔹 Installing Flatpak apps..."
for app in "${FLATPAK_APPS[@]}"; do
    flatpak install -y flathub "$app"
done

# Install Native Packages
NATIVE_APPS=(
    "bleachbit"
    "gnome-tweaks"
    "fastfetch"
    "tldr"
    "bat"
    "eza"
    "bash-completion"
    "hstr"
    "micro"
	"fd-find"
)

echo "🔹 Installing native packages..."
for package in "${NATIVE_APPS[@]}"; do
    $INSTALL_CMD $package
done

echo "Install Zoxide"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

echo "Install Starship"
curl -sS https://starship.rs/install.sh | sh

echo "Install yazi file manager"
flatpak run com.google.Chrome "https://yazi-rs.github.io/docs/installation"

echo "Install VS Code manually..."
flatpak run com.google.Chrome "https://code.visualstudio.com/Download"

echo "🕶 Setting up Immersed AppImage..."
flatpak run com.google.Chrome "https://immersed.com/"

echo "✅ Installation complete!"
