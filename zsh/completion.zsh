# Enable command-line autocompletion
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit

# Add custom completion scripts to the fpath
fpath=(~/.zsh $fpath)

# Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

# AWS CLI completion
complete -C '/opt/homebrew/bin/aws_completer' aws

