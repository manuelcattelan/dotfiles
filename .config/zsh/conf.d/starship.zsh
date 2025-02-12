# https://starship.rs/guide/#%F0%9F%9A%80-installation

# Change default configuration file location
export STARSHIP_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/starship/starship.toml"

# Set up shell integration (key bindings and fuzzy completion).
eval "$(starship init zsh)"
