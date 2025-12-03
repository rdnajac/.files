_nvim_oilssh_passthrough() {
  if [[ ${words[CURRENT]} == oil-ssh://* ]]; then
    words[CURRENT]=${words[CURRENT]#oil-ssh://}
  fi
  _rsync
}

compdef _nvim_oilssh_passthrough nvim

: '
oil() {
	if [[ $1==*:* ]]; then
		h=${1%%:*}
		p=${1#*:}
	else
		h=$1
		p=~
	fi
	nvim oil-ssh://"$h/$p"
}

compdef _rsync oil
