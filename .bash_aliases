sudo dmesg -C
echo "the computing scientist's main challenge is not to get confused by the complexities of his own making"
#PS1='\[\e[1;2m\]\t \[\e[0;1m\]\u\[\e[0;97m\]@\[\e[0;1m\]\h\[\e[0m\]:\[\e[96;1m\]\w\[\e[39m\]\$ '

alias qq='cd ~/f23-hmwk6-team32/'
alias qqq='qq && vim myez.c ezfs_ops.h'
alias dna='cd ~/dna'
alias kmake='cd ~/kernel_dev/linux  && sudo make -j5 && sudo make modules_install -j3  && sudo make install && sudo reboot'

alias ads='cd ~/go/src/adscodex'
alias qq='cd ~/f23-hmwk5-team32/'
alias qqq='cd ~/f23-hmwk5-team32/linux/kernel/'
alias q4='cd ~/f23-hmwk5-team32/user/part4'
#alias q5='cd ~/f23-hmwk3-team32/user/part5'

alias ff='cd ~/.files'

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
alias bd='cd -'
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..'

# settings
alias vimm='vim ~/.vimrc'
alias bashr='vim ~/.bashrc'
alias basha='vim ~/.bash_aliases'
alias bashf='vim ~/.bash_functions'
alias nvv='cd ~/.config/nvim/lua/user'

alias mv='mv -v'
alias rm='rm -I -v'
alias cpv='rsync -ahv --info=progress2'
alias rmdir='rm -drvI'
#alias bmake ='bear make -j'

# functions
function cl() {
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
