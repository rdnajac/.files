# vim: set ft=zsh wrap:
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/TeX/texbin:/Applications"

source ~/.files/bash_aliases
source ~/.files/bash_profile
alias zr='vim ~/.zshrc'
alias ls='gls --color=auto'
alias python='python3'

autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
#zstyle ':vcs_info:git:*' formats "%F{yellow}f"
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "%F{green}*%f"
# zstyle ':vcs_info:git:*' unstagedstr "%F{red}*%f"
# zstyle ':vcs_info:git:*' untrackedstr "%F{yellow}*%f"
# zstyle ':vcs_info:git:*' formats "%F{cyan}%b%f %F{green}%c%f %F{red}%u%f %F{yellow}%m%f"

NEWLINE=$'\n'
PSPWD='%F{blue}%~%f'
PSTIME='%F{magenta}%D{%s}%f'
PSERROR='%(?.√.%F{red}exit %F{yellow}%?)%f'
PSRUB="₽ "
PS1="${PSTIME} ${PSPWD} ${PSERROR} ${NEWLINE}${PSRUB}"

copy () { cat $@ | pbcopy }

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

complete -C '/usr/local/bin/aws_completer' aws

# test -r /Users/rdn/.opam/opam-init/init.sh && . /Users/rdn/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

