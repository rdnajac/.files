export EDITOR=vim

# https://www.arp242.net/zshrc.html#easier-path
# typeset -U path  # No duplicates
# path=()
#
# _prepath() {
#   for dir in "$@"; do
#     dir=${dir:A}
#     [[ ! -d "$dir" ]] && return
#     path=("$dir" $path[@])
#   done
# }
#
# _postpath() {
#   for dir in "$@"; do
#     dir=${dir:A}
#     [[ ! -d "$dir" ]] && return
#     path=($path[@] "$dir")
#   done
# }
#
# _prepath /bin /sbin /usr/bin /usr/sbin /usr/games
# _prepath /usr/pkg/bin   /usr/pkg/sbin   # NetBSD
# _prepath /usr/X11R6/bin /usr/X11R6/sbin # OpenBSD
# _prepath /usr/local/bin /usr/local/sbin
#
# _prepath "$HOME/.local/bin"
#
# unfunction _prepath
# unfunction _postpath

export PATH=$PATH:$DOTDIR/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin

if [[ "$OSTYPE" == darwin* ]]; then
  export PATH=$PATH:/Library/Frameworks/R.framework/Resources/bin
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
