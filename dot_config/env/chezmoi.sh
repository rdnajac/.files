alias cz='chezmoi --verbose'
alias cza='cz add'
alias czA='cz apply'
alias czc='cz cd'
alias czd='cz diff'
alias cze='cz edit'
alias czi='cz init'
alias czm='cz managed'
alias czr='cz re-add'
alias czs='cz status'
alias czu='cz unmanaged'
alias czx='cz execute-template'

function czedit() { chezmoi edit --apply --verbose "$@"; }
# fallback to $HOME/.config if $XDG_CONFIG_HOME is not set
: "${XDG_CONFIG_HOME:=$HOME/.config}"

alias zr='czedit ${ZDOTDIR}'
alias ba='czedit $HOME/.bash_aliases'
# alias vvv='czedit $XDG_CONFIG_HOME/vim/'
alias vvv='cd $XDG_CONFIG_HOME/vim/'
# alias nvv='czedit $XDG_CONFIG_HOME/vim/lua'
alias nvv='cd $XDG_CONFIG_HOME/vim/lua'
alias tmx='czedit $XDG_CONFIG_HOME/tmux/tmux.conf'
