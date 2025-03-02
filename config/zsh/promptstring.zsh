NEWLINE=$'\n'
PSPWD='%F{blue}%~%f'
# PSTIME='%F{magenta}%D{%s}%f'
PSTIME='%F{magenta}%D{%H:%M:%S}%f'
PSERROR='%(?.√.%F{red}exit %F{yellow}%?)%f'
PSRUB="₽ "
PS1="[${PSTIME}] ${PSPWD} ${PSERROR}${NEWLINE}${PSRUB}"
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"
