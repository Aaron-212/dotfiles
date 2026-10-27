# PATH (same priority as env.nu)
typeset -U path PATH
path=(
    "$HOME/go/bin"
    "$HOME/Library/Android/sdk/platform-tools"
    "$HOME/Library/Android/sdk/emulator"
    "$HOME/.modular/bin"
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$(/opt/homebrew/bin/brew --prefix)/sbin"
    "$(/opt/homebrew/bin/brew --prefix)/bin"
    "$(/opt/homebrew/bin/brew --prefix icu4c@78)/sbin"
    "$(/opt/homebrew/bin/brew --prefix icu4c@78)/bin"
    "$(/opt/homebrew/bin/brew --prefix llvm)/bin"
    "$(/opt/homebrew/bin/brew --prefix curl)/bin"
    "$(/opt/homebrew/bin/brew --prefix rustup)/bin"
    /Library/TeX/texbin
    /usr/local/bin
    "${path[@]}"
)
export PATH

# General
export EDITOR="zed"
export PAGER="less -R --mouse"
export LANG="zh_CN.UTF-8"
export LANGUAGE="zh_CN.UTF-8:zh_TW.UTF-8:en_US.UTF-8"

# SSH
export SSH_SK_PROVIDER="/usr/lib/ssh-keychain.dylib"

# Homebrew
export HOMEBREW_BAT="1"
export HOMEBREW_NO_ENV_HINTS="1"
export HOMEBREW_UPGRADE_GREEDY_CASKS="discord, keepingyouawake"
export HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS="1"

# Carapace
export CARAPACE_BRIDGES="zsh,fish,bash"

# q
export Q_DEFAULT_SERVER="https://dns.alidns.com"

# Starship
if [[ $NO_STARSHIP != "true" ]]; then
    export STARSHIP_CONFIG=~/dotfiles/starship.toml
else
    unset STARSHIP_CONFIG
fi

# Load private KEY=value settings without evaluating shell code.
if [[ -r "$HOME/dotfiles/.env" ]]; then
    () {
        local key value
        while IFS='=' read -r key value || [[ -n "$key" ]]; do
            if [[ "$key" =~ '^[A-Za-z_][A-Za-z0-9_]*$' ]]; then
                export "$key=$value"
            fi
        done <"$HOME/dotfiles/.env"
    }
fi
