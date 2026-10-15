fpath+=~/.zfunc
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

# Clear the current command line with Ctrl+C.
clear-command-line() {
    export BUFFER=""
    export CURSOR=0
}
zle -N clear-command-line
bindkey -M emacs '^C' clear-command-line
bindkey -M viins '^C' clear-command-line
bindkey -M vicmd '^C' clear-command-line

eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"
source <(carapace _carapace zsh)
eval "$(pay-respects zsh --alias f)"

if [[ $NO_STARSHIP != "true" ]]; then
    eval "$(starship init zsh)"
fi

source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
