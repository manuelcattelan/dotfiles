#!/bin/zsh

export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-less}"

# You can use .zprofile.local to set private environmental variables.
if [[ -f "${ZDOTDIR:-$HOME}/.zprofile.local" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprofile.local"
fi
