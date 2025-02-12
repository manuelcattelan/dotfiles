# https://github.com/nvm-sh/nvm

# Export nvm configuration directory.
export NVM_DIR="$HOME/.config/nvm"

# Set up shell integration (key bindings and fuzzy completion).
if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"  
fi
