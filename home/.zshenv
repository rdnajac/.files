# HACK: https://www.reddit.com/r/zsh/comments/3ubrdr/comment/cxe7ejm
export ZDOTDIR=$HOME/.zsh # actually a symbolic link
# .  # load the true .zshenv

if [ -f "${ZDOTDIR}/.zshenv" ]; then
    . "${ZDOTDIR}/.zshenv"
fi
