# https://github.com/junegunn/fzf

# Export fzf commands' options.
export FZF_DEFAULT_OPTS="--bind change:top"
export FZF_CTRL_T_OPTS="--height 100% --no-sort --reverse"
export FZF_CTRL_R_OPTS="--height 100% --no-sort --reverse"

# Set up shell integration (key bindings and fuzzy completion).
source <(fzf --zsh)
