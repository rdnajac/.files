# .zshrc - my custom zsh configuration

setopt interactivecomments # Don't error on `#` in command line

. $ZDOTDIR/promptstring.zsh
. $ZDOTDIR/clipboardfunctions.zsh
. $ZDOTDIR/completion.zsh
. ${ZDOTDIR}/nnn.zsh

# aliases {{{
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias brewup='brew update; brew upgrade; brew cleanup -s;'
alias ls='gls -F --color=auto --group-directories-first'
alias ctags='$(brew --prefix)/bin/ctags'
alias conda='micromamba'
alias mm='micromamba'
alias mminstall='micromamba install -c conda-forge -c bioconda'
# alias repro='nvim -u ~/GitHub/repro.lua'

# quickly edit config files
alias   ba='${EDITOR:-vim} $HOME/.bash_aliases'
alias  tmx='${EDITOR:-vim} $HOME/.tmux.conf'
alias alac='${EDITOR:-vim} $HOME/.alacritty.toml'
alias   zr='${EDITOR:-vim} ${ZDOTDIR:-$HOME}/.zshrc'
# }}}

# FZF_ALT_C_COMMAND= source <(fzf --zsh)
# source "${THISDIR}/config/fzf.sh"
# source <(tree-sitter complete --shell zsh)

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

alias cat=bat
alias ls=eza

alias n=nnn

eval "${$(zoxide init zsh):s#_files -/#_cd#}"
alias cd=z

echo "The computing scientist's main challenge is not to get confused by the complexities of his own making."
# vim: ft=sh fdm=marker fdl=0
