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
    echo "(╯°□°)╯︵ ┻━┻"
    #echo "┻━┻ ︵ ヽ(°□°ヽ)" 
    echo ""
    #echo " ¯\_(ツ)_/¯ "
    #echo "(╮°-°)╮┳━┳ "
    exec bash
}

