autoload -Uz colors && colors

NEWLINE=$'\n'
PSPWD='%F{blue}%~%f'
# PSTIME='%F{magenta}%D{%s}%f'
PSTIME='%F{magenta}%D{%H:%M:%S}%f'
PSERROR='%(?.√.%F{red}exit %F{yellow}%?)%f'
PSRUB="₽ "
# PS1="╭[${PSTIME}] ${PSPWD} ${PSERROR}${NEWLINE}╰ ${CONDA_DEFAULT_ENV} ${PSRUB}"
PS1="${NEWLINE}╭─[${PSTIME}] ${PSPWD} ${PSERROR}${NEWLINE}╰─► ${PSRUB}"

# make the prompt like bash on non-macOS
if [[ "$OSTYPE" != darwin* ]]; then
	PS1='%B%F{green}%n@%m%f:%F{blue}%~%f%b$ '
fi

# Add the nnn level to the prompt if it exists
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

SUDO_PROMPT="$(tput setaf 2 bold)Password: $(tput sgr0)" && export SUDO_PROMPT
