# Enable command-line autocompletion
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit

# Add custom completion scripts to the fpath
fpath=($ZDOTDIR/completions $fpath)

complete -C '/opt/homebrew/bin/aws_completer' aws
# zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
# zstyle ':completion:*:*:wezterm:*' script ~/.zsh/_wezterm
