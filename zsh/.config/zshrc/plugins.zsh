echo "Carmen"

# Zsh completions & history
autoload -Uz compinit && compinit

# zoxide (require: zoxide)
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"

# zsh-autosuggestions (require: zsh, zsh-autosuggestions repo cloned)
[ -d ~/.config/zsh/plugins/zsh-autosuggestions ] && source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting (require: zsh, zsh-syntax-highlighting repo cloned)
[ -d ~/.config/zsh/plugins/zsh-syntax-highlighting ] && source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf key bindings (require: fzf)
[ -x "$(command -v fzf)" ] && source <(fzf --zsh)
