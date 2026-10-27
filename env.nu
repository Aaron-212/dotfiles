use std/util "path add"

path add "/usr/local/bin"
path add "/Library/TeX/texbin"
path add $"(^/opt/homebrew/bin/brew --prefix rustup)/bin"
path add $"(^/opt/homebrew/bin/brew --prefix curl)/bin"
path add $"(^/opt/homebrew/bin/brew --prefix llvm)/bin"
path add $"(^/opt/homebrew/bin/brew --prefix icu4c@78)/bin"
path add $"(^/opt/homebrew/bin/brew --prefix icu4c@78)/sbin"
path add $"(^/opt/homebrew/bin/brew --prefix)/bin"
path add $"(^/opt/homebrew/bin/brew --prefix)/sbin"
path add $"($env.HOME)/.cargo/bin"
path add $"($env.HOME)/.local/bin"
path add $"($env.HOME)/.modular/bin"
path add $"($env.HOME)/Library/Android/sdk/emulator"
path add $"($env.HOME)/Library/Android/sdk/platform-tools"
path add $"($env.HOME)/go/bin"

# General
$env.EDITOR = "zed"
$env.PAGER = "less -R --mouse"
$env.LANG = "zh_CN.UTF-8"
$env.LANGUAGE = "zh_CN.UTF-8:zh_TW.UTF-8:en_US.UTF-8"

# SSH
$env.SSH_SK_PROVIDER = "/usr/lib/ssh-keychain.dylib"

# Homebrew
$env.HOMEBREW_BAT = "1"
$env.HOMEBREW_NO_ENV_HINTS = "1"
let upgrade_greedy_casks = [
    "discord"
    "keepingyouawake"
]
$env.HOMEBREW_UPGRADE_GREEDY_CASKS = $upgrade_greedy_casks | str join ", "
$env.HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS = "1"

# Starship
if ($env | get -o NO_STARSHIP | default null) != "true" {
    $env.STARSHIP_CONFIG = $"($env.HOME)/dotfiles/starship.toml"
} else {
    # Disable Starship
    $env.STARSHIP_CONFIG = null
}

# Carapace
$env.CARAPACE_BRIDGES = "zsh,fish,bash"

# VENV prompt
$env.VIRTUAL_ENV_DISABLE_PROMPT = true

# q
$env.Q_DEFAULT_SERVER = "https://dns.alidns.com"

# Load private KEY=value settings as literal strings.
let secrets_file = $env.HOME | path join "dotfiles/.env"
if ($secrets_file | path exists) {
    open --raw $secrets_file
    | lines
    | parse --regex '^(?<key>[A-Za-z_][A-Za-z0-9_]*)=(?<value>.*)$'
    | transpose --header-row --ignore-titles --as-record
    | default {}
    | load-env
}

# Generate tool integrations before Nushell loads the vendor autoload directory.
if $nu.is-interactive {
    source "~/dotfiles/init.nu"
}
