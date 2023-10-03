echo "the computing scientist's main challenge is not to get confused by the complexities of his own making"

alias vi='vim'
alias nv='nvim'
alias bcat='batcat'

# tmux
alias tmux='tmux -2'
alias tmx'=tmux attach-session'
alias kms='tmux kill-server'

# ls
#alias ll='ls -Al --group-directories-first'
alias ll='ls -AlFh --group-directories-first'
alias l='ls -lFh --group-directories-first'
alias lt='ls --human-readable --size -1 -S --classify'

# navigation
alias qq='cd ~/f23-hmwk2-team14/linux/kernel'
alias q3='cd ~/f23-hmwk2-team14/user/part3'
alias bd='cd -'
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..'

# settings
alias vimm='vim ~/.vimrc'
alias bashr='vim ~/.bashrc'
alias basha='vim ~/.bash_aliases'
alias bashf='vim ~/.bash_functions'
alias nvv='cd ~/.config/nvim/lua'

alias mv='mv -v'
alias rm='rm -I -v'
alias cpv='rsync -ahv --info=progress2'
alias rmdir='rm -drvI'
#alias bmake ='bear make -j'

# functions
function cd() {
    DIR="$*";
	# if no DIR given, go home
	if [ $# -lt 1 ]; then
		DIR=$HOME;
	fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
	ll
}

function ree {
    clear -x
    echo ""
    echo "(╯°□°)╯︵ ┻━┻"
    echo ""
    exec bash
}
