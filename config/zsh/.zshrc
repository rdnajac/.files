# .zshrc - my custom zsh configuration

setopt interactivecomments
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

SUDO_PROMPT="$(tput setaf 2 bold)Password: $(tput sgr0)" && export SUDO_PROMPT
# LS_COLORS="$($DOTDIR/etc/LS_PY)" && export LS_COLORS

export EDITOR=vim
export MANPAGER="$(which nvim) +Man!"
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# Source shell configs for specific programs
. $DOTDIR/etc/nnn.sh
. $DOTDIR/etc/fzf.sh
. $DOTDIR/etc/neovim.sh

# Source custom zsh configs
. $ZDOTDIR/promptstring.zsh
. $ZDOTDIR/clipboardfunctions.zsh
. $ZDOTDIR/aliases.zsh
. $ZDOTDIR/options.zsh
. $ZDOTDIR/zle.zsh
. $ZDOTDIR/completion.zsh # FIXME:

# set up Ruby environment
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version

# TODO: can this go in zshenv or profile?
export MAMBA_EXE="$HOME/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="$HOME/.cache/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup

eval "$(zoxide init zsh)"
eval "${$(zoxide init zsh):s#_files -/#_cd#}"
alias cd=z

echo "The computing scientist's main challenge is not to get confused by the complexities of his own making."
