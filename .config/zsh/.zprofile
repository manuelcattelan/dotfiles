#!/bin/zsh

export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-less}"

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Update path for executables with custom $HOME/.scripts folder.
path=($HOME/.scripts $path)

# You can use .zprofile.local to set private environmental variables.
if [[ -f "${ZDOTDIR:-$HOME}/.zprofile.local" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprofile.local"
fi
