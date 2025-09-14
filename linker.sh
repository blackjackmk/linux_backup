#!/bin/bash

# ~/.backup/dotfiles/linker.sh
PROFILE=${1:-common} # Default to 'common' if no argument is provided

REPO_ROOT="$HOME/.backup"
COMMON_DIR="$REPO_ROOT/common"
PROFILE_DIR="$REPO_ROOT/profiles/$PROFILE"
TARGET_DIR="$HOME"

echo "Linking profile: $PROFILE"

# Function to create a symlink for a file
create_symlink() {
    local file=$1
    local base_dir=$2
    local rel_path="${file#$base_dir/}"
    local target_file="$TARGET_DIR/$rel_path"

    mkdir -p "$(dirname "$target_file")"
    ln -sfv "$file" "$target_file"
}

# 1. Always link ALL files from the common directory
if [ -d "$COMMON_DIR" ]; then
    echo "Linking common files..."
    find "$COMMON_DIR" -type f | while read -r file; do
        create_symlink "$file" "$COMMON_DIR"
    done
else
    echo "Error: Common directory '$COMMON_DIR' not found."
    exit 1
fi

# 2. Link ALL files from the specified profile directory (if it exists and is not 'common')
if [ "$PROFILE" != "common" ] && [ -d "$PROFILE_DIR" ]; then
    echo "Linking profile-specific files for '$PROFILE'..."
    find "$PROFILE_DIR" -type f | while read -r file; do
        create_symlink "$file" "$PROFILE_DIR"
    done
fi

# Run final commands
fc-cache -fv
echo "Linker finished successfully for profile: $PROFILE"
echo "Please run 'source ~/.bashrc' or restart your shell to apply changes."
