# Zsh Line Editor (ZLE) configuration
# https://zsh.sourceforge.io/Guide/zshguide04.html#l76
# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Zsh-Line-Editor

# Run command without clearing input with `<M-Enter>`
bindkey '\e\r' accept-and-hold
# XXX: Tested on alacrity, but not on other terminals

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search

bindkey "^[[1;2D" backward-word     # Shift + Left
bindkey "^[[1;2C" forward-word      # Shift + Right
bindkey "^[[1;6D" beginning-of-line # Shift + Ctrl + Left
bindkey "^[[1;6C" end-of-line       # Shift + Ctrl + Right

# https://zsh.sourceforge.io/Guide/zshguide04.html#l87
export WORDCHARS=${WORDCHARS//[&.;\/]}
