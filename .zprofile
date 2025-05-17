export EDITOR="nvim"
export VISUAL="nvim"

export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts/:$PATH"
export PATH="$HOME/.config/emacs/bin/:$PATH"
# export XDG_MENU_PREFIX=arch kbuildsycoca6

# NPM
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
