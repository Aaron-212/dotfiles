# mkcd alias
function mkcd
{
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

# Pager
PAGER='less --mouse --wheel-lines=1'

# safe-rm
alias rm='safe-rm'

# init profile based on uname
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source ~/dotfiles/profiles/linux.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  source ~/dotfiles/profiles/darwin.zsh
fi

# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/dotfiles/omp.json)"
