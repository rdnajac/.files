autoload -Uz colors && colors

# default password prompt
# enum colors `black=0 red=1 green=2 yellow=3 blue=4 magenta=5 cyan=6 white=7`
SUDO_PROMPT="$(tput setaf 0 setab 1 bold)Password:$(tput sgr0) "
export SUDO_PROMPT

NEWLINE=$'\n'
CWD='   %F{blue}%~%f'
# TIME='%F{magenta}%D{%s}%f'
TIME='%F{magenta}%D{%H:%M:%S}%f'
ERR='%(?.√.%F{red}exit %F{yellow}%?)%f'
RUBLE="₽ "

if [ "$NVIM" != "" ]; then
	PS1=" [$TIME]  "
else
	# PS1="╭[${TIME}] ${PWD} ${ERR}${NEWLINE}╰ ${CONDA_DEFAULT_ENV} ${PSRUB}"
	# PS1="${NEWLINE}╭─[${TIME}] ${PWD} ${ERR}${NEWLINE}╰─► ${RUBLE}"
	PS1="$CWD ${NEWLINE}╭─[${TIME}] ${ERR}${NEWLINE}╰─► $RUBLE"
fi

# make the prompt like bash on non-macOS
if [[ $OSTYPE != darwin* ]]; then
	PS1='%B%F{green}%n@%m%f:%F{blue}%~%f%b$ '
fi

# Add the nnn level to the prompt if it exists
[ "$NNNLVL" != "" ] && PS1="N$NNNLVL $PS1"
