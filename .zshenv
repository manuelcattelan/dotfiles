#!/bin/zsh

# Set XDG Base Directory specification.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

# Set ZDOTDIR if you want to re-home Zsh.
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# You can use .zprofile to set environment vars for non-login, non-interactive shells.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# You can use .zprofile.local to set private environmental vars for non-login, non-interactive shells.
if [[ -f "${ZDOTDIR:-$HOME}/.zprofile.local" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprofile.local"
fi
