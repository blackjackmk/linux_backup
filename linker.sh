#!/bin/bash

# ~/.backup/linker.sh
# Unified script for linking dotfiles and installing applications.

# Configuration
REPO_ROOT="$HOME/.backup"
COMMON_DIR="$REPO_ROOT/common"
TARGET_DIR="$HOME"

# --- Application Lists ---

FLATPAK_APPS=(
    "org.telegram.desktop"
    "org.signal.Signal"
    "com.github.PintaProject.Pinta"
    "com.usebottles.bottles"
    "com.github.tchx84.Flatseal"
    "io.github.wivrn.wivrn"
    "org.onlyoffice.desktopeditors"
    "com.valvesoftware.Steam"
    "com.unity.UnityHub"
    "md.obsidian.Obsidian"
    "app.zen_browser.zen"
    "com.google.Chrome"
    "com.vysp3r.ProtonPlus"
)

CLI_APPS=(
    "kitty"
    "git"
    "fastfetch"
    "bash-completion"
    "fd-find"
    "hstr"
    "tldr"
    "bat"
    "duf"
    "eza"
    "btm"
    "micro"
    "qimgv"
    "sqlitebrowser"
    "7zip"
)

GNOME_APPS=(
    "gnome-tweaks"
    "flatpak"
    "gnome-software-plugin-flatpak"
)

# Common utilities for Wayland Window Managers (Sway/Hyprland)
WAYLAND_COMMON=(
    "waybar"
    "wofi"
    "sway-notification-center"
    "gtklock"
    "swayidle"
    "swaybg"
    "swayosd"
    "sudo"
    "curl"
    "network-manager"
    "blueman"
    "bluez"
    "gvfs"
    "libnotify-bin"
    "wireplumber"
    "pavucontrol"
    "gammastep"
    "grim"
    "slurp"
    "wl-clipboard"
    "policykit-1-gnome"
    "zenity"
    "power-profiles-daemon"
)

SWAY_APPS=("sway" "${WAYLAND_COMMON[@]}")
HYPRLAND_APPS=("hyprland" "${WAYLAND_COMMON[@]}")

# --- Functions ---

usage() {
    echo "Usage: $0 [profile] [options]"
    echo "Profiles: gnome (default), sway, hyprland"
    echo "Options:"
    echo "  --update    Only update symlinks, skip installation"
    echo "  --help      Show this help message"
    echo ""
    echo "Example:"
    echo "  $0 sway           # Install and link Sway profile"
    echo "  $0 --update       # Only update symlinks for GNOME"
    exit 1
}

create_symlink() {
    local file=$1
    local base_dir=$2
    local rel_path="${file#$base_dir/}"
    local target_file="$TARGET_DIR/$rel_path"

    mkdir -p "$(dirname "$target_file")"
    ln -sfv "$file" "$target_file"
}

confirm() {
    local prompt=$1
    read -p "$prompt [y/N]: " response
    case "$response" in
        [yY][eE][sS]|[yY])
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

link_files() {
    local profile=$1
    local profile_dir="$REPO_ROOT/profiles/$profile"

    echo "--- Linking files for profile: $profile ---"

    # 1. Always link ALL files from the common directory
    if [ -d "$COMMON_DIR" ]; then
        echo "Linking common files..."
        find "$COMMON_DIR" -type f | while read -r file; do
            create_symlink "$file" "$COMMON_DIR"
        done
    else
        echo "Warning: Common directory '$COMMON_DIR' not found."
    fi

    # 2. Link files from the specified profile directory (Skip for GNOME as it uses dconf)
    if [ "$profile" != "gnome" ] && [ -d "$profile_dir" ]; then
        echo "Linking profile-specific files for '$profile'..."
        find "$profile_dir" -type f | while read -r file; do
            create_symlink "$file" "$profile_dir"
        done
    elif [ "$profile" != "gnome" ]; then
        echo "Warning: Profile directory '$profile_dir' not found."
    fi

    if [ "$profile" = "gnome" ]; then
        DCONF_FILE="$REPO_ROOT/profiles/gnome/gnome_settings.dconf"
        if [ -f "$DCONF_FILE" ]; then
            dconf load / < "$DCONF_FILE"
        fi
    fi
}

install_apps() {
    local profile=$1
    echo "--- Starting installation for profile: $profile ---"

    sudo apt update

    # 1. Install CLI Apps
    echo "Installing common CLI apps..."
    sudo apt install -y "${CLI_APPS[@]}"

    # 2. Install Profile Specific Apps
    echo "Installing $profile specific apps..."
    case $profile in
        gnome)
            sudo apt install -y "${GNOME_APPS[@]}"
            ;;
        sway)
            sudo apt install -y "${SWAY_APPS[@]}"
            ;;
        hyprland)
            sudo apt install -y "${HYPRLAND_APPS[@]}"
            ;;
    esac

    # 3. Install Flatpak Apps
    if confirm "Install Flatpak apps?"; then
        if command -v flatpak &> /dev/null; then
            echo "Setting up Flatpak and installing apps..."
            sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
            for app in "${FLATPAK_APPS[@]}"; do
                flatpak install -y flathub "$app"
            done
        else
            echo "Flatpak not found, skipping flatpak apps."
        fi
    fi

    # 4. External Installers
    echo "Checking external installers..."

    # Zoxide
    if confirm "Install Zoxide (smarter cd)?"; then
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
    fi

    # Starship
    if confirm "Install Starship (cross-shell prompt)?"; then
        curl -sS https://starship.rs/install.sh | sh
    fi

    # Zed
    if confirm "Install Zed (high-performance code editor)?"; then
        curl -f https://zed.dev/install.sh | sh
    fi

    # Ollama
    if confirm "Install Ollama (run LLMs locally)?"; then
        curl -fsSL https://ollama.com/install.sh | sh
    fi

    # UV (Python)
    if confirm "Install UV (extremely fast Python package manager)?"; then
        curl -LsSf https://astral.sh/uv/install.sh | sh

        # Add local bin to path for current session to use newly installed uv
        export PATH="$HOME/.local/bin:$PATH"

        # UV tools (ty and ruff)
        if command -v uv &> /dev/null; then
            uv tool install ty@latest
            uv tool install ruff@latest
        fi
    fi

    # Qloader
    if confirm "Install Qloader (VR tools)?"; then
        /bin/bash -c "$(curl -fsSL https://cloud.dipvr.ru/onlineinstall/)"
    fi

    echo "Note: Some apps (Yazi, Immersed) might require manual installation steps."
    echo "Yazi: https://yazi-rs.github.io/docs/installation"
    echo "Immersed: https://immersed.com/"
}

# --- Main Logic ---

PROFILE="gnome"
ONLY_LINK=false

# Simple argument parsing
for arg in "$@"; do
    case $arg in
        gnome|sway|hyprland)
            PROFILE=$arg
            ;;
        --update)
            ONLY_LINK=true
            ;;
        --help)
            usage
            ;;
    esac
done

if [ "$ONLY_LINK" = false ]; then
    install_apps "$PROFILE"
fi

link_files "$PROFILE"

# Finalize
fc-cache -fv

echo ""
echo "Setup finished successfully for profile: $PROFILE"
echo "Please restart your shell or run 'source ~/.bashrc' to apply all changes."
