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

# nvm
NVM_LAZY_LOAD=false
zplugin light "lukechilds/zsh-nvm"

# npm
#zplugin light 'lukechilds/zsh-better-npm-completion'

# Fancy syntax highlighting
zplugin light zdharma/fast-syntax-highlighting

## Colors for LS (macOS)
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"

# fuzzy completions, but breaks npm completions
zplugin snippet PZT::modules/completion/init.zsh

# fzf binary, completion, and zsh key bindings
zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin
zplugin snippet 'https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh'
zplugin snippet 'https://github.com/junegunn/fzf/blob/master/shell/completion.zsh'

# Aliases
alias g=git
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'

alias dcr='docker-compose run --rm'

# zsh options
setopt histignorealldups
setopt sharehistory

# Custom shell configurations
[ -e "$HOME/.zsh/rvm.zsh" ] && source "$HOME/.zsh/rvm.zsh"
[ -e "$HOME/.zsh/theme.zsh" ] && source "$HOME/.zsh/theme.zsh"
[ -e "$HOME/.zsh/mongo.zsh" ] && source "$HOME/.zsh/mongo.zsh"
[ -e "$HOME/.zsh/android-studio.zsh" ] && source "$HOME/.zsh/android-studio.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
