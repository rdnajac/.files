echo "the computing scientist's main challenge is not to get confused by the complexities of his own making"
alias cd='cl'
# prompt
if [ "$ZSH_VERSION" ]; then
    PS1='[%F{magenta}%*%f] %F{blue}%~%f ₽ '
    #alias vim ='vim -S ~/.files/.vimrc'
else
    #PS1='\[\e[1;2m\]\t \[\e[0;1m\]\u\[\e[0;97m\]@\[\e[0;1m\]\h\[\e[0m\]:\[\e[96;1m\]\w\[\e[39m\]\$ '
fi

if [ "$ZSH_VERSION" ]; then
    copy() { cat $1 | pbcopy }
fi


# shortcuts
alias qq='cd ~/gscs/network_labs/lab3-rdnajac'
alias ff='cd ~/.files'
alias vi='vim'
alias nv='nvim'
alias p3='python3'
alias bd='cd -'
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..'

# settings
alias vimm='vim ~/.files/.vimrc'
alias bashr='vim ~/.files/.bashrc'
alias basha='vim ~/.files/.bash_aliases'
alias nvv='cd ~/.config/nvim/lua/ && ll'
alias alac='vim ~/.files/alacritty.yml'

# linux kernel development
alias kmake='cd ~/kernel_dev/linux && sudo make -j5 && \
    sudo make modules_install -j3  && sudo make install && sudo reboot'

# tmux
alias tmx='tmux attach-session'
alias kms='tmux kill-server'

# use gnu ls and stat on apple os
if [ !"$BASH" ]; then
    alias ls='gls --color=auto'
    #alias stat='gstat'
fi

alias ll='ls -AlFh --group-directories-first'
alias l='ls -lFh --group-directories-first'
alias lt='ls --human-readable --size -1 -S --classify'

# be verbose and ask for promt on file 'deletion'
alias mv='mv -vi'
alias rm='rm -vi'

alias cpv='rsync -ahv --info=progress2'
alias rmdir='rm -drvI'
alias bmake='bear -- make'
alias vimfect='~/.files/scripts/vimfect.sh'

function cl() {
    DIR="$*";
    if [ $# -lt 1 ]; then
        DIR=$HOME;
    fi;
    builtin cd "${DIR}" && l
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
        make clean || true
        if git diff --quiet && git diff --cached --quiet; then
            echo "No changes to commit."
        else
            echo "Do you want to save changes in this repository? (y/n)"
            read response
            if [[ $response =~ ^[Yy]$ ]]; then
                git add .

                echo "Files staged for commit:"
                git diff --cached --name-only

                echo "Enter your commit message:"
                read msg
                git commit -m "$msg"

                echo "Do you want to push changes to the remote repository? (y/n)"
                read response
                if [[ $response =~ ^[Yy]$ ]]; then
                    git push
                    echo "Changes committed and pushed from $repo."
                else echo "Changes committed but not pushed."
                fi
            else
                echo "Changes not saved."
            fi
        fi
    else
        echo "You are not in a Git repository. Changes not saved."
    fi
}

