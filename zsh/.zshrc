# Source all files in ~/.config/zshrc/
for file in ~/.config/zshrc/*.zsh; do
    [ -f "$file" ] && source "$file"
done
