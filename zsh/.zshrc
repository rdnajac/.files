# .zshrc - my custom zsh configuration

. $ZDOTDIR/promptstring.zsh
. $ZDOTDIR/clipboardfunctions.zsh
. $ZDOTDIR/completion.zsh
. $ZDOTDIR/aliases.zsh
. $ZDOTDIR/options.zsh

. $DOTDIR/etc/nnn.sh
. $DOTDIR/etc/fzf.sh

# set up Ruby environment
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version

export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/rdn/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
	eval "$__mamba_setup"
else
	alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# uncomment to replace cd with zoxide
eval "${$(zoxide init zsh):s#_files -/#_cd#}"
alias cd=z

echo "The computing scientist's main challenge is not to get confused by the complexities of his own making."
