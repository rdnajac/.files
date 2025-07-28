# https://www.chezmoi.io
eval "$(chezmoi completion zsh)"

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
alias cztest='cz execute-template --file'
alias czz='$VISUAL $CHEZMOI_SOURCE_DIR/dot_config/zsh'
