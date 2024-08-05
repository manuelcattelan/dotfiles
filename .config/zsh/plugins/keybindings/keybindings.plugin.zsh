# https://github.com/zsh-users/zsh-history-substring-search.
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# Improve jump to next/previous words.
bindkey '^F' forward-word
bindkey '^B' backward-word

# Improve command line editing.
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line

# Accept autocomplete suggestion with <CTRL+y>.
bindkey '^Y' autosuggest-accept
