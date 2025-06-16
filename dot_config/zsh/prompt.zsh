autoload -Uz colors && colors

NEWLINE=$'\n'
PWD='   %F{blue}%~%f'
# TIME='%F{magenta}%D{%s}%f'
TIME='%F{magenta}%D{%H:%M:%S}%f'
ERR='%(?.√.%F{red}exit %F{yellow}%?)%f'
RUBLE="₽ "
# PS1="╭[${TIME}] ${PWD} ${ERR}${NEWLINE}╰ ${CONDA_DEFAULT_ENV} ${PSRUB}"
# PS1="${NEWLINE}╭─[${TIME}] ${PWD} ${ERR}${NEWLINE}╰─► ${RUBLE}"
PS1="${PWD} ${NEWLINE}╭─[${TIME}] ${ERR}${NEWLINE}╰─► ${RUBLE}"

# make the prompt like bash on non-macOS
if [[ "$OSTYPE" != darwin* ]]; then
	PS1='%B%F{green}%n@%m%f:%F{blue}%~%f%b$ '
fi

# Add the nnn level to the prompt if it exists
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

SUDO_PROMPT="$(tput setaf 2 bold)Password: $(tput sgr0)" && export SUDO_PROMPT
