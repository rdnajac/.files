# Zsh Line Editor (ZLE)
# https://zsh.sourceforge.io/Guide/zshguide04.html#l76
# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Zsh-Line-Editor

# Run command without clearing input with `<M-Enter>`
# tested on alacrity, ghostty
bindkey '\e\r' accept-and-hold

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search # Arrow up
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search # Arrow down
bindkey '^[OB' down-line-or-beginning-search

bindkey "^[[1;2D" backward-word # <S-Left>
bindkey "^[[1;2C" forward-word  # <S-Right>
# bindkey "^[[1;3D" backward-word   # <M-Left>
# bindkey "^[[1;3C" forward-word    # <M-Right>
# NOTE: my terminal receives `<M-b>` and `<M-f>`
#
bindkey "^[[1;4D" beginning-of-line # <M-S-Left>
bindkey "^[[1;4C" end-of-line       # <M-S-Right>

# https://zsh.sourceforge.io/Guide/zshguide04.html#l87
export WORDCHARS=${WORDCHARS//[&.;\/]/}

change-first-word() {
	zle beginning-of-line -N
	zle kill-word
}
zle -N change-first-word
bindkey '^H' change-first-word # <C-BS> to delete first word
