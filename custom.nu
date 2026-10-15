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
