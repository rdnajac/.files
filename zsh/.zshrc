# .zshrc - my custom zsh configuration
set -x
# export PATH=$PATH:$DOTDIR/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/usr/local/bin

export EDITOR=vim
export LS_COLORS="$($DOTDIR/etc/LS_PY)"

export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# chec if were on darwin
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH=$PATH:/opt/nvim-macos-arm64/bin
  export PATH=$PATH:/Library/Frameworks/R.framework/Resources/bin
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
set +x

# TODO Make these POSIX-compliant
. $DOTDIR/etc/nnn.sh
. $DOTDIR/etc/fzf.sh
. $DOTDIR/etc/mamba.sh

. $ZDOTDIR/promptstring.zsh
. $ZDOTDIR/clipboardfunctions.zsh
. $ZDOTDIR/aliases.zsh
. $ZDOTDIR/options.zsh
# FIXME:
. $ZDOTDIR/completion.zsh

# set up Ruby environment
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version


eval "$(zoxide init zsh)"
eval "${$(zoxide init zsh):s#_files -/#_cd#}"
alias cd=z

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

echo "The computing scientist's main challenge is not to get confused by the complexities of his own making."
