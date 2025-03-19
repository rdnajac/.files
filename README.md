# My .files

[`vim`](.vim/README.md)
[`nvim`](nvim/README.md)

## Config

Terminal emulators

- [Alacritty](https://alacritty.org/config-alacritty.html)
- [WezTerm](https://wezterm.org/config/lua/general.html)
- [Kitty](https://sw.kovidgoyal.net/kitty/conf/)

> [!IMPORTANT]
> Download a patched version of [`JetBrainsMono`](https://github.com/JetBrains/JetBrainsMono)
> with all the glyphs we need for neovim from
> [nerd-fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures/Regular)

## Connect to GitHub with SSH

[Generate new SSH key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

```sh
ssh-keygen -t ed25519 -C "ryan.najac@columbia.edu"
```

[Add SSH key to GitHub](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

```sh
# On macOS:
pbcopy < ~/.ssh/id_ed25519.pub

# On Linux:
xclip -selection clipboard < ~/.ssh/id_ed25519.pub
```

> [!IMPORTANT]
> Add the new key [here](https://github.com/settings/keys)

[Test SSH connection](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/testing-your-ssh-connection)

```sh
ssh -T git@github.com
```

## Rust clones

These can all be installed with `cargo install <package>` or,
if on MacOS, with `brew install <package>`.

|                                                   | replaces |
| ------------------------------------------------- | -------- |
| [`bat`](https://github.com/sharkdp/bat)           | `cat`    |
| [`eza`](https://github.com/eza-community/eza)     | `ls`     |
| [`rg`](https://github.com/BurntSushi/ripgrep)     | `grep`   |
| [`fd`](https://github.com/sharkdp/fd)             | `find`   |
| [`btm`](https://github.com/ClementTsang/bottom)   | `htop`   |
| [`zoxide`](https://github.com/ajeetdsouza/zoxide) | `cd`     |
| [`procs`](https://github.com/dalance/procs)       |          |
| [`dust`](https://github.com/bootandy/dust)        | `du`     |

### Install Rust

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Install neovim requierments

```sh
rust install fd-find ripgrep pokeget
```

### Install everything

```sh
cargo install bat eza ripgrep fd-find bottom zoxide procs
```

## eza

### plugins/preview-tui

uses the following command to display directories

```sh
fifo_pager eza -T --group-directories-first --colour=always -L 3
```

Testing other eza commands

```sh
eza -T --group-directories-first --colour=always -L 3 --icons=auto
```

```

```
