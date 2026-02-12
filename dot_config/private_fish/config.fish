if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
    set -gx MANPATH (brew --prefix)/share/man $MANPATH

    # source ~/.bash_aliases if it exists
    if test -f ~/.bash_aliases
        source ~/.bash_aliases
    end
end
