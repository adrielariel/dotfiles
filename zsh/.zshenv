# PATH
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# Local secrets (API keys, tokens) — not tracked in git
[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"
