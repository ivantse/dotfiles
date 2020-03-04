# Load the pure theme, with zsh-async library that's bundled with it
# Use with: https://github.com/sindresorhus/iterm2-snazzy
#zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure
#alias fix-git-status='prompt_pure_async_init=0; async_stop_worker prompt_pure'

# https://github.com/agkozak/agkozak-zsh-prompt
AGKOZAK_LEFT_PROMPT_ONLY=1
AGKOZAK_BLANK_LINES=1
zplugin load agkozak/agkozak-zsh-prompt
