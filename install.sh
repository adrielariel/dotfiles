#!/usr/bin/env bash
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/projects/dotfiles}"
STOW_FOLDERS="${STOW_FOLDERS:-}"

if [[ ! -d "$DOTFILES" ]]; then
    echo "Error: $DOTFILES does not exist"
    exit 1
fi

if [[ -z "$STOW_FOLDERS" ]]; then
    echo "STOW_FOLDERS is not set. Nothing to install."
    echo ""
    echo "Usage: STOW_FOLDERS=\"git,zsh,tmux\" ./install.sh"
    echo ""
    echo "Available packages:"
    for dir in "$DOTFILES"/*/; do
        [ -d "$dir" ] && echo "  $(basename "$dir")"
    done
    exit 0
fi

echo "Installing stow packages: $STOW_FOLDERS"
cd "$DOTFILES"

for folder in $(echo "$STOW_FOLDERS" | tr "," "\n"); do
    if [[ -d "$folder" ]]; then
        stow -d "$DOTFILES" -t "$HOME" -D "$folder" 2>/dev/null || true
        stow -d "$DOTFILES" -t "$HOME" "$folder"
        echo "  ✓ $folder"
    else
        echo "  ✗ $folder (not found, skipping)"
    fi
done

# Post-stow hooks
if echo "$STOW_FOLDERS" | tr "," "\n" | grep -qx "hyprland"; then
    if pgrep -x Hyprland >/dev/null 2>&1; then
        echo "  ⟳ Reloading Hyprland in 1s..."
        (sleep 1 && hyprctl reload) &
    fi
fi

echo "Done!"
