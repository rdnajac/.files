autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search

bindkey "^[[1;2D" backward-word    # Shift + Left
bindkey "^[[1;2C" forward-word     # Shift + Right

# https://zsh.sourceforge.io/Guide/zshguide04.html#l87
export WORDCHARS=${WORDCHARS//[&.;\/]}
