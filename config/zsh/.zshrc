# .zshrc - my custom zsh configuration

SUDO_PROMPT="$(tput setaf 2 bold)Password: $(tput sgr0)" && export SUDO_PROMPT

export EDITOR=vim
export MANPAGER="$(which nvim) +Man!"
# export LS_COLORS="$($DOTDIR/etc/LS_PY)"
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# TODO Make these POSIX-compliant
. $DOTDIR/etc/nnn.sh
. $DOTDIR/etc/fzf.sh
. $DOTDIR/etc/mamba.sh

. $ZDOTDIR/promptstring.zsh
. $ZDOTDIR/clipboardfunctions.zsh
. $ZDOTDIR/aliases.zsh
. $ZDOTDIR/options.zsh
. $ZDOTDIR/zle.zsh
# FIXME:
. $ZDOTDIR/completion.zsh

# set up Ruby environment
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version

eval "$(zoxide init zsh)"
eval "${$(zoxide init zsh):s#_files -/#_cd#}"
alias cd=z

echo "The computing scientist's main challenge is not to get confused by the complexities of his own making."
