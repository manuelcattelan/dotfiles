#!/bin/zsh

export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-less}"

# Setup Homebrew binaries
eval "$(/opt/homebrew/bin/brew shellenv)"
