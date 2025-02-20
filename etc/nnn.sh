#!/bin/sh

export VISUAL=ewrap

# -e open text files in $VISUAL (else $EDITOR, fallback vi) [preferably CLI]
# -E use $EDITOR for internal undetached edits
# -H show hidden files
export NNN_OPTS="eEH"

# bookmarks
export NNN_BMS="\
G:$HOME/GitHub;\
.:$HOME/GitHub/rdnajac/.files;\
L:$HOME/.local/share/nvim/lazy/;\
"

# plugins
# NOTE: use single quotes for `NNN_PLUG` to avoid shell expansion
export NNN_PLUG="\
f:fzopen;\
l:!lazygit;\
n:!nvim;\
x:!chmod +x '$nnn';\
z:autojump;\
"

# export NNN_SSHFS='sshfs -o reconnect,idmap=user,cache_timeout=3600'

n() {
	# Block nesting of nnn in subshells
	[ "${NNNLVL:-0}" -eq 0 ] || exit

	# The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
	# If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
	# see. To cd on quit only on ^G, remove the "export" and make sure not to
	# use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
	#      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
	export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

	# Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
	# stty start undef
	# stty stop undef
	# stty lwrap undef
	# stty lnext undef

	# Set the default directory to open nnn with
	# if $PWD is home, set dir to ~/Github/ othwewise leave i alone
	DIR="."
	if [ "$(realpath "$PWD")" = "$HOME" ]; then
		DIR="$HOME/Github"
	fi

	# The command builtin allows one to alias nnn to n, if desired, without
	# making an infinitely recursive alias
	command nnn "$@" "$DIR"

	[ ! -f "$NNN_TMPFILE" ] || {
		. "$NNN_TMPFILE"
		rm -f -- "$NNN_TMPFILE" > /dev/null
	}
}

# sync subshell directory with nnn
nnn_cd() {
	if ! [ -z "$NNN_PIPE" ]; then
		printf "%s\0" "0c${PWD}" ! > "${NNN_PIPE}" &
	fi
}

trap nnn_cd EXIT
