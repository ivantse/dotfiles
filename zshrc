# Set up zplugin
local -A ZPLGM
ZPLGM[HOME_DIR]="${ZDOTDIR:-$HOME}/.zplugin"
if [[ ! -d "${ZPLGM[HOME_DIR]}" ]]; then
  mkdir -p "${ZPLGM[HOME_DIR]}"
  git clone https://github.com/zdharma/zplugin.git "${ZPLGM[HOME_DIR]}/bin"
fi
source "${ZPLGM[HOME_DIR]}/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# Load the pure theme, with zsh-async library that's bundled with it
# Use with: https://github.com/sindresorhus/iterm2-snazzy
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

# Fancy syntax highlighting
zplugin light zdharma/fast-syntax-highlighting

# fzf binary, completion, and zsh key bindings
zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin
zplugin snippet 'https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh'
zplugin snippet 'https://github.com/junegunn/fzf/blob/master/shell/completion.zsh'

# Aliases
alias g=git
alias gs='git status'
alias gd='git diff'

# zsh options
setopt histignorealldups
setopt sharehistory

# Custom shell configurations
[ -e "$HOME/.zsh/rvm.zsh" ] && source "$HOME/.zsh/rvm.zsh"
[ -e "$HOME/.zsh/mongo.zsh" ] && source "$HOME/.zsh/mongo.zsh"
