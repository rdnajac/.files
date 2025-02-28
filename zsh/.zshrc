# .zshrc - my custom zsh configuration

# TODO Make these POSIX-compliant
. $DOTDIR/etc/nnn.sh
. $DOTDIR/etc/fzf.sh

. $ZDOTDIR/promptstring.zsh
. $ZDOTDIR/clipboardfunctions.zsh
. $ZDOTDIR/aliases.zsh
. $ZDOTDIR/options.zsh

# FIXME:
. $DOTDIR/etc/mamba.sh
set +x
. $ZDOTDIR/completion.zsh

# set up Ruby environment
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version

eval "${$(zoxide init zsh):s#_files -/#_cd#}"
alias cd=z

echo "The computing scientist's main challenge is not to get confused by the complexities of his own making."
