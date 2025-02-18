NEWLINE=$'\n'
PSPWD='%F{blue}%~%f'
PSTIME='%F{magenta}%D{%s}%f'
PSERROR='%(?.√.%F{red}exit %F{yellow}%?)%f'
PSRUB="₽ "
PS1="${PSTIME} ${PSPWD} ${PSERROR}${NEWLINE}${PSRUB}"
