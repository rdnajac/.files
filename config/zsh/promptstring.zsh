NEWLINE=$'\n'
PSPWD='%F{blue}%~%f'
# PSTIME='%F{magenta}%D{%s}%f'
PSTIME='%F{magenta}%D{%H:%M:%S}%f'
PSERROR='%(?.√.%F{red}exit %F{yellow}%?)%f'
PSRUB="₽ "
PS1="[${PSTIME}] ${PSPWD} ${PSERROR}${NEWLINE}${PSRUB}"
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

if [[ "$OSTYPE" != darwin* ]]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi
