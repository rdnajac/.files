eval "$(zoxide init zsh)"
eval "${$(zoxide init zsh):s#_files -/#_cd#}"
alias cd=z
alias zx='zoxide remove "$PWD" && echo "Removed $PWD from zoxide database."'
