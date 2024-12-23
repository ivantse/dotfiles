# Set up zinit
local -A ZINIT
ZINIT[HOME_DIR]="${ZDOTDIR:-$HOME}/.zinit"
if [[ ! -d "${ZINIT[HOME_DIR]}" ]]; then
  mkdir -p "${ZINIT[HOME_DIR]}"
  git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT[HOME_DIR]}/bin"
fi
source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# nvm
NVM_LAZY_LOAD=false
zinit light "lukechilds/zsh-nvm"

# Fancy syntax highlighting
zinit light zdharma/fast-syntax-highlighting

## Colors for LS (macOS)
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"

# fuzzy completions, but breaks npm completions
zinit snippet PZT::modules/completion/init.zsh

export EDITOR='nvim'
export GPG_TTY=$(tty)

# Aliases
alias g=git
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias dcr='docker compose run --rm'

# zsh options
setopt histignorealldups
setopt sharehistory

# Custom shell configurations
[ -e "$HOME/.zsh/rvm.zsh" ] && source "$HOME/.zsh/rvm.zsh"
[ -e "$HOME/.zsh/theme.zsh" ] && source "$HOME/.zsh/theme.zsh"
[ -e "$HOME/.zsh/mongo.zsh" ] && source "$HOME/.zsh/mongo.zsh"
[ -e "$HOME/.zsh/android-studio.zsh" ] && source "$HOME/.zsh/android-studio.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

case "$OSTYPE" in
  darwin*)
    eval "$(/opt/homebrew/bin/brew shellenv)"
  ;;
esac

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
