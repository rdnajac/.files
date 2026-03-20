# .files

My dotfiles repository, managed with [chezmoi](https://chezmoi.io/).

## Install script

Installs chezmoi binary to `~/.local/bin`
```sh
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply https://github.com/rdnajac/.files.git
```

## Terminal

### [Ghostty](https://ghostty.org/)

> Ghostty is a fast, feature-rich, and cross-platform terminal
> emulator that uses platform-native UI and GPU acceleration.

Pros:

- Default font is JetBrains (with glyphs)

## TODO:

eval "$(/usr/libexec/path_helper)"

missing or unsuitable terminal: xterm-ghostty
https://ghostty.org/docs/help/terminfo#ssh


## Resources:

https://www.chezmoi.io/user-guide/templating/

## License

