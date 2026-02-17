# ZDOTDIR

When in doubt, `man zsh`

> [!IMPORTANT]
> Commands are then read from `$ZDOTDIR/.zshenv`. If the shell is a login shell,
> commands are read from `/etc/zprofile` and then `$ZDOTDIR/.zprofile`. Then, if
> the shell is interactive, commands are read from `/etc/zshrc` and then
> `$ZDOTDIR/.zshrc`. Finally, if the shell is a login shell, `/etc/zlogin` and
> `$ZDOTDIR/.zlogin` are read.

## `~/.zshenv`

Soureced at the start of every zsh session, whether interactive or not.
Add the following line to `~/.zshenv` to set up the ZDOTDIR:

```sh

export ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh
```

### XDG Base Directories

```sh
# Define XDG Base Directories in case they are not set
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
```

### cargo

I think this belongs here:

```sh
# source cargo environment if it exists (POSIX-compliant)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
```

## TODO:

- [x] zsh treesitter parser
- [x] bat, eza, fd-find, ripgrep, zoxide

## Resources

- [The Z Shell Manual](https://zsh.sourceforge.io/Doc/Release/index.html)
- [A User's Guide to the Z-Shell](https://zsh.sourceforge.io/Guide/zshguide.html)
- [Zsh Wiki](https://zshwiki.org/)

### Deep Dives

- [Dotfile load order](https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout)
