THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

installed() {
  if command -v "$1" &>/dev/null; then
    return 0
  else
    echo "$1 is not installed!"
    return 1
  fi
}

sync_file() {
    local src="$THISDIR/$1"
    local dest="$HOME/.$1"
    if [ -e "$dest" ]; then
        echo "found .$1 in home directory"
        if [ ! -L "$dest" ]; then
            echo "moving .$1 to .$1.old"
            mv -iv "$dest" "$dest.old"
        fi
    fi
    echo "linking $1..."
    ln -sfv "$src" "$dest"
}

[[ ! $(installed tmux) ]] && sync_file tmux.conf
[[ ! $(installed git) ]] && sync_file gitconfig
[[ "$OSTYPE" == "darwin"* ]] && sync_file zshrc


if installed alacritty; then
    alacritty_dir="$HOME/.config/alacritty"
    mkdir -vp "$alacritty_dir"
    ln -sfn "$HOME/.files/alacritty.toml" "$alacritty_dir/alacritty.toml" 
fi

exec $SHELL
