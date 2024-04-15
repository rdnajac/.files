PS1='[%F{magenta}%*%f] %F{blue}%~%f ₽ '

alias zr='vim ~/.zshrc'
alias ls='gls --color=auto'
source ~/.files/bash_profile

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

copy() { cat $1 | pbcopy }

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

complete -C '/usr/local/bin/aws_completer' aws

[[ ! -r /Users/rdn/.opam/opam-init/init.zsh ]] || source /Users/rdn/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
