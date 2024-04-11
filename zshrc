PS1='[%F{magenta}%*%f] %F{blue}%~%f ₽ '

alias ls='gls --color=auto'
source ~/.files/shell/aliases
alias zr='vim ~/.zshrc'

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# copy file contents to clipboard
copy() { cat $1 | pbcopy }

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws

alias mymysql='mysql -u labaf_ryan -p -h palomerolab.org --ssl-mode=REQUIRED'

# opam configuration
[[ ! -r /Users/rdn/.opam/opam-init/init.zsh ]] || source /Users/rdn/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
