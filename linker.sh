#!/bin/bash
# ~/linux_backup/link.sh

DOTFILES_DIR="$HOME/.backup/dotfiles"
TARGET_DIR="$HOME"

# Create symlinks recursively
find "$DOTFILES_DIR" -type f | while read -r file; do
    # Get relative path (removing DOTFILES_DIR prefix)
    rel_path="${file#$DOTFILES_DIR/}"
    target_file="$TARGET_DIR/$rel_path"
    
    # Create parent directory if needed
    mkdir -p "$(dirname "$target_file")"
    
    # Create symlink (force overwrite)
    ln -sfv "$file" "$target_file"
done
