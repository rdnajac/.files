# https://www.arp242.net/zshrc.html#easier-path
typeset -U path  # No duplicates
path=()

_prepath() {
  for dir in "$@"; do
    dir=${dir:A}
    [[ ! -d "$dir" ]] && return
    path=("$dir" $path[@])
  done
}
_postpath() {
  for dir in "$@"; do
    dir=${dir:A}
    [[ ! -d "$dir" ]] && return
    path=($path[@] "$dir")
  done
}

_prepath /bin /sbin /usr/bin /usr/sbin /usr/games
_prepath /usr/pkg/bin   /usr/pkg/sbin   # NetBSD
_prepath /usr/X11R6/bin /usr/X11R6/sbin # OpenBSD
_prepath /usr/local/bin /usr/local/sbin

_prepath "$HOME/go/bin"                # Go
_prepath "$HOME/.local/bin"            # My local stuff.
if [[ -d "$HOME/.gem/ruby" ]]; then    # Ruby
  for d in "$HOME/.gem/ruby/"*; do
    _postpath "$d/bin";
  done
fi

unfunction _prepath
unfunction _postpath
