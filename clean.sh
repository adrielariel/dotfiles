#!/usr/bin/env bash
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/projects/dotfiles}"
STOW_FOLDERS="${STOW_FOLDERS:-git,zsh,tmux,nvim,kitty,ghostty,hyprland,waybar,rofi,bin}"

echo "Removing stow packages: $STOW_FOLDERS"
cd "$DOTFILES"

for folder in $(echo "$STOW_FOLDERS" | tr "," "\n"); do
    if [[ -d "$folder" ]]; then
        stow -d "$DOTFILES" -t "$HOME" -D "$folder" 2>/dev/null || true
        echo "  ✓ $folder"
    else
        echo "  ✗ $folder (not found, skipping)"
    fi
done

echo "Done!"
