#!/bin/bash
(
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && git rev-parse --show-toplevel)"

CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

##
# Function: symlink
# Description: create a symlink in the home directory
# Arguments: $1 - dotfile name (e.g. tmux.conf)
#
symlink() {
    local dest="$HOME/.$1"
    if [ -e "$HOME/.$1" ]; then
        echo "found .$1 in home directory"
        if [ ! -L "$dest" ]; then
            echo "moving .$1 to .$1.old"
            mv -iv "$dest" "$dest.old"
        fi
    fi
    echo "linking $1..."
    ln -sfv "$REPO_ROOT/$1" "$dest"
}

symlink tmux.conf

# [[ command zsh > /dev/null ]] && symlink zshrc

# command -v alacritty > /dev/null && \
#   mkdir -vp "$CONFIG_HOME/alacritty" && \
#   ln -sfn "$REPO_ROOT/alacritty/alacritty.yml" \
#   "$CONFIG_HOME/alacritty/alacritty.yml"
)
exec $SHELL
