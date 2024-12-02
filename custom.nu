# mkcd alias
def --env mkcd [directory: path]: nothing -> nothing {
    mkdir $directory
    cd $directory
}

alias ofile = /usr/bin/open
