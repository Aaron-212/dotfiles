# macOS open alias
def --env o [directory?: path]: nothing -> nothing {
    try { ^open ($directory | default .) }
}

# macOS debug open app alias
def --env debugapp [directory: path]: nothing -> nothing {
    try { ^open -a $directory --args -_NS_4445425547 true }
}

# mkcd alias
def --env mkcd [directory: path]: nothing -> nothing {
    mkdir $directory
    cd $directory
}

# Clone into ~/Repos/<hosting>/<owner>/<repo> using an HTTPS or SSH URL.
def gclone [url: string] {
    let pattern = '(?x)^
        (?:(?:https?|ssh|git)://)?
        (?:[^/@:]+@)?
        (?P<hosting>[a-zA-Z0-9.-]+)
        (?::[0-9]+)?[/:]
        (?P<owner>[^/\\?#\s:]+)
        /(?P<repo>[^/\\?#\s:]+?)(?:\.git)?/?
        $'
    let parts = $url | parse --regex $pattern
    if ($parts | is-empty) {
        error make {msg: "Expected a Git URL with a hosting domain, owner, and repository."}
    }

    let parts = $parts | first
    if ([$parts.hosting $parts.owner $parts.repo] | any {|part| $part in ["." ".."] }) {
        error make {msg: "Hosting, owner, and repository cannot be '.' or '..'."}
    }

    let destination = $env.HOME | path join Repos $parts.hosting $parts.owner $parts.repo
    mkdir ($destination | path dirname)
    ^git clone -- $url $destination
}

# remove quarantine flag
def --env unqr [file: path]: nothing -> nothing {
    ^xattr -d com.apple.quarantine $file
}

# chmod +x alias
def --env chx [file: path]: nothing -> nothing {
    ^chmod +x $file
}

def --env activate [directory?: path] {
    let activate_path = if ($directory | is-empty) {
        ".venv/bin/activate.nu"
    } else {
        $directory | path join "bin/activate.nu"
    }

    nu -e $"overlay use ($activate_path)"
}
