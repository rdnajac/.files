source ~/.files/bash_aliases
alias zr='vim ~/.zshrc'
alias vimhome='cd /opt/homebrew/Cellar/vim/9.1.0600/share/vim/vim91/'

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

complete -C '/usr/local/bin/aws_completer' aws
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
#zstyle ':vcs_info:git:*' formats "%F{yellow}f"
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "%F{green}*%f"
# zstyle ':vcs_info:git:*' unstagedstr "%F{red}*%f"
# zstyle ':vcs_info:git:*' untrackedstr "%F{yellow}*%f"
# zstyle ':vcs_info:git:*' formats "%F{cyan}%b%f %F{green}%c%f %F{red}%u%f %F{yellow}%m%f"

# set the prompt
NEWLINE=$'\n'
PSPWD='%F{blue}%~%f'
PSTIME='%F{magenta}%D{%s}%f'
PSERROR='%(?.√.%F{red}exit %F{yellow}%?)%f'
PSRUB="₽ "
PS1="${PSTIME} ${PSPWD} ${PSERROR}${NEWLINE}${PSRUB}"

# https://tldp.org/LDP/abs/html/optimizations.htm
# export LC_ALL=C
# ( ͡° ͜ʖ ͡°) What are you doing Dave?

alias mm=micromamba
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/Users/rdn/cbmf/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/rdn/cbmf/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
