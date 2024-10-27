if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Homebrew
PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/aaron212/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Mojo
export MODULAR_HOME="/Users/aaron212/.modular"
export PATH="/Users/aaron212/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

# Homebrew-command-not-found
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
source "$HB_CNF_HANDLER";
fi

# zsh syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# editor
export EDITOR=codeedit

function mkcd
{
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

# Created by `pipx` on 2024-06-15 15:25:47
export PATH="$PATH:/Users/aaron212/.local/bin"

# Pager
PAGER='less --mouse --wheel-lines=1'

export PATH="$PATH:/Users/aaron212/.modular/bin"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(oh-my-posh init zsh --config ~/.omp.json)"
