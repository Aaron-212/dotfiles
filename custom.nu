# macOS open alias
def --env o [directory?: path]: nothing -> nothing {
    try {
        ^open ($directory | default .)
    }
}

# mkcd alias
def --env mkcd [directory: path]: nothing -> nothing {
    mkdir $directory
    cd $directory
}
