#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    directories_to_search=$1
else
    directories_to_search=$(find ~/Programming ~/Programming/work ~/Programming/personal -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $directories_to_search ]]; then
    exit 1
fi

directories_to_search_formatted=$(basename "$directories_to_search" | tr . _)

if [[ -z $TMUX ]] && [[ -z $(pgrep tmux) ]]; then
    tmux new-session -s $directories_to_search_formatted -c $directories_to_search
    exit 0
fi

if ! tmux has-session -t=$directories_to_search_formatted 2> /dev/null; then
    tmux new-session -ds $directories_to_search_formatted -c $directories_to_search
fi

tmux switch-client -t $directories_to_search_formatted
