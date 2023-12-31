echo "the computing scientist's main challenge is not to get confused by the complexities of his own making"

# set prompt
if [ "$ZSH_VERSION" ]; then
  PS1='[%F{magenta}%*%f] %F{blue}%~%f ₽ '
  #alias vim ='vim -S ~/.files/.vimrc'
else
  #PS1='\[\e[1;2m\]\t \[\e[0;1m\]\u\[\e[0;97m\]@\[\e[0;1m\]\h\[\e[0m\]:\[\e[96;1m\]\w\[\e[39m\]\$ '
fi


# clear ring buffer
#sudo dmesg -C

# shortcuts
alias ff='cd ~/.files'
alias dna='cd ~/dna'
#alias ads='cd ~/go/src/adscodex'
alias cpp='cd ~/cpp-sandbox'
alias qq='cd ~/gscs/my-http-server'

# settings
alias vimm='vim ~/.files/.vimrc'
alias bashr='vim ~/.files/.bashrc'
alias basha='vim ~/.files/.bash_aliases'
alias nvv='cd ~/.config/nvim/lua/ && ll'
alias alac='vim ~/.files/alacritty.yml'

# linux kernel development
alias kmake='cd ~/kernel_dev/linux  && sudo make -j5 && sudo make modules_install -j3  && sudo make install && sudo reboot'


alias vi='vim'
alias nv='nvim'
alias bcat='batcat'

# tmux
alias tmux='tmux -2'
alias tmx'=tmux attach-session'
alias kms='tmux kill-server'

# ls
alias ll='ls -AlFh --group-directories-first'
if [ !"$BASH" ]; then
  alias ls='gls --color=auto'
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

# lazy git add/commit/push
save() {
  repo=$(git rev-parse --show-toplevel 2> /dev/null)
  if [ $? -eq 0 ]; then
    echo "You are currently in the Git repository located at: $repo"
    if git diff --quiet; then
      echo "No changes to commit."
    else
      echo "Do you want to save changes in this repository? (y/n)"
      read response
      if [[ $response =~ ^[Yy]$ ]]; then
        git add .
        # Default commit message based on the repository
        if [ "$repo" = "$HOME/.files" ]; then
          commitMsg="update settings"
        else
          echo "Enter your commit message:"
          read commitMsg
        fi
        git commit -m "$commitMsg"
        git push
        echo "Changes committed and pushed from $repo."
      else
        echo "Changes not saved."
      fi
    fi
  else
    echo "You are not in a Git repository. Changes not saved."
  fi
}

