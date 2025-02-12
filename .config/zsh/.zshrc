# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Clone Antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] || git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# Set the root name of the plugins files Antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zplugins

# Ensure the .zplugins file exists so you can add plugins.
[[ -f ${zsh_plugins} ]] || touch ${zsh_plugins}

# Lazy-load Antidote from its functions directory.
fpath=(${ZDOTDIR:-~}/.antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zplugins is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins} ]]; then
    antidote bundle <${zsh_plugins} >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh
