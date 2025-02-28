set -x
export DOTDIR=$HOME/GitHub/rdnajac/.files
export ZDOTDIR=$HOME/GitHub/rdnajac/.files/zsh

if [ -f "$ZDOTDIR/.zshenv" ]; then
    . "${ZDOTDIR}/.zshenv"
fi
