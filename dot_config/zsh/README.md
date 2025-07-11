# ZDOTDIR

When in doubt, `man zsh`

> [!IMPORTANT]
> Commands are then read from `$ZDOTDIR/.zshenv`. If the shell is a login shell,
> commands are read from `/etc/zprofile` and then `$ZDOTDIR/.zprofile`. Then, if
> the shell is interactive, commands are read from `/etc/zshrc` and then
> `$ZDOTDIR/.zshrc`. Finally, if the shell is a login shell, `/etc/zlogin` and
> `$ZDOTDIR/.zlogin` are read.

## TODO:

- [ ] zsh treesitter parser

## Resources

- [The Z Shell Manual](https://zsh.sourceforge.io/Doc/Release/index.html)
- [A User's Guide to the Z-Shell](https://zsh.sourceforge.io/Guide/zshguide.html)
- [Zsh Wiki](https://zshwiki.org/)

Dotfile load order:

- <https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout>
