echo "the computing scientist's main challenge is not to get confused by the complexities of his own making"

# set prompt
if [ "$ZSH_VERSION" ]; then
  PS1='[%F{magenta}%*%f] %F{blue}%~%f ₽ '
else
#PS1='\[\e[1;2m\]\t \[\e[0;1m\]\u\[\e[0;97m\]@\[\e[0;1m\]\h\[\e[0m\]:\[\e[96;1m\]\w\[\e[39m\]\$ '
fi


# clear ring buffer
#sudo dmesg -C

# shortcuts
alias ff='cd ~/.files'
alias dna='cd ~/dna'
alias ads='cd ~/go/src/adscodex'

# settings
alias vimm='vim ~/.files/.vimrc'
alias bashr='vim ~/.files/.bashrc'
alias basha='vim ~/.files/.bash_aliases'
alias nvv='cd ~/.config/nvim/lua/user'

# linux kernel development
alias qq='cd ~/kenel_dev/'
alias kmake='cd ~/kernel_dev/linux  && sudo make -j5 && sudo make modules_install -j3  && sudo make install && sudo reboot'


alias vi='vim'
alias nv='nvim'
alias bcat='batcat'

# tmux
alias tmux='tmux -2'
alias tmx'=tmux attach-session'
alias kms='tmux kill-server'

# ls
if [ "$BASH" ]; then
  alias ll='ls -AlFh --group-directories-first'
else
  alias ll='ls -AlFhG'
fi

alias l='ls -lFh --group-directories-first'
alias lt='ls --human-readable --size -1 -S --classify'

# navigation
alias bd='cd -'
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..'

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
    echo -e "\n(╯°□°)╯︵ ┻━┻\n"
    if [ "$ZSH_VERSION" ]; then
        exec zsh
    else
        exec bash
    fi
}

save() {
  # Check if the current working directory is ~/.files
  if [ "$(pwd)" = "$HOME/.files" ]; then
    # Change into the directory to make sure we are in ~/.files
    cd "$HOME/.files" || exit 1

    # Check if there are changes to commit
    if git diff --quiet; then
      echo "No changes to commit."
    else
      # Add all changes, commit, and push
      git add .
      git commit -m "update settings"
      git push
      echo "Changes committed and pushed."
    fi
  else
    echo "Not in the ~/.files directory. Changes not saved."
  fi
}

