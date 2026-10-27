fpath+=~/.zfunc
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

# Clear the current command line with Ctrl+C.
bindkey '^M' self-insert

# Cmd+Enter executes the command (Ghostty sends F12)
bindkey '\e[24~' accept-line

eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"
source <(carapace _carapace zsh)
eval "$(pay-respects zsh --alias f)"

if [[ $NO_STARSHIP != "true" ]]; then
    eval "$(starship init zsh)"
fi

source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
