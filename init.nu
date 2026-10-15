#!/opt/homebrew/bin/nu

let autoload_dir = $nu.data-dir | path join "vendor/autoload"
mkdir $autoload_dir
/opt/homebrew/bin/zoxide init nushell | save -f ($autoload_dir | path join "zoxide.nu")
/opt/homebrew/bin/starship init nu | save -f ($autoload_dir | path join "starship.nu")
/opt/homebrew/bin/carapace _carapace nushell | save -f ($autoload_dir | path join "carapace.nu")
/opt/homebrew/bin/pay-respects nushell --alias "f" | save -f ($autoload_dir | path join "pay-respects.nu")
/opt/homebrew/bin/mise activate nu | save -f ($autoload_dir | path join "mise.nu")
