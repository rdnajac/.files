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

## TODO

- [ ] Add bootstrap script for custom comment treesitter

### markdown

- [ ] Make check boxes work as a list so they appear on subsequent newlines

# nvim config

## Installation

Install prereqs:

```sh
sudo apt-get install ninja-build gettext cmake curl build-essential
```

Build from source:

```sh
git clone https://github.com/neovim/neovim.git
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install
cd  .. && ls
```

## Plugins

Use [`lazy.nvim`](https://lazy.folke.io/) to manage plugins and spend hours
optimizing for milliseconds load times.

## Snacks

### Image

Equation to do null hypothesis testing:

$$
Z = \frac{\bar{X} - \mu}{\sigma / \sqrt{n}}
$$

> [!NOTE]
> This only renders inline in `kitty` terminal.

## QoL

Some plugins save their state in the cache. If you want to reset the state of a
plugin, you can delete the cache.

```sh
rm -rf ~/.cache/nvim
```

Others will save files to ~/.local/share/nvim. You can delete these files, too.

```sh
rm -rf ~/.local/share/nvim
```

| `<plugin>`       | note                        | `<path>`                      |
| ---------------- | --------------------------- | ----------------------------- |
| `blink`          | Blink.cmp completion cache  | `~/.local/share/nvim/blink`   |
| `harpoon`        | Harpoon menu buffers        | `~/.local/share/nvim/harpoon` |
| `lazy`           | LazyVim root                | `~/.local/share/nvim/lazy`    |
| `mason`          | Mason packages and binaries | `~/.local/share/nvim/mason`   |
| `Snacks.scratch` | Snacks scratch buffers      | `~/.local/share/nvim/scratch` |
| `Snacks.picker`  | Snacks picker histories     | `~/.local/share/nvim/snacks`  |

Finally, there is ~/.local/state/nvim, where we have:

- backup/
- grug-far/
- lazy/
- sessions/
- shada/
- swap/
- undo/
- various log files

To clean up:

```sh
rm -rf ~/.local/state/nvim/{*.log,sessions,swap,undo}
```

## Resources

- [Neovim](https://neovim.io/)
- [`lazy.nvim` plugin manager](https://lazy.folke.io/)
- [LazyVim](https://www.lazyvim.org)
- [`lsp-zero`](https://lsp-zero.netlify.app/docs/)
- <https://boltless.me/posts/neovim-config-without-plugins-2025/>

---

> The computing scientist's main challenge is not to get confused
> by the complexities of his own making.

-- _Edsger W. Dijkstra_

# .vim

My Vim configuration.

## Resources

- [Five Minute Vimscript](http://andrewscala.com/vimscript/)
- [Extra vim-plug stuff](https://github.com/junegunn/vim-plug/wiki/extra)

## netrw

h: netrw provides 'ssh hints':

```vimdoc
Thomer Gil has provided a hint on how to speed up netrw+ssh:
http://thomer.com/howtos/netrw_ssh.html

Alex Young has several hints on speeding ssh up:
http://usevim.com/2012/03/16/editing-remote-files/
```

Both pages are offline...

- <https://web.archive.org/web/20120319233142/https://www.usevim.com/2012/03/16/editing-remote-files/>

- <https://web.archive.org/web/20120319233142/https://www.usevim.com/2012/03/16/editing-remote-files/#expand>
<!-- TODO: add image sources -->

Luckily they have been cached by the Internet Archive.

## Cheatsheet

![Vim Cheatsheet](./assets/vim-cheatsheet.png)

## Pipes

![Vim Pipes](./assets/vim-pipes.png)

## Spell Checking

Download [cspell](http://streetsidesoftware.github.io/cspell/)
dictionaries from [cspell-dicts](https://github.com/streetsidesoftware/cspell-dicts/tree/main/dictionaries)

## References

- [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)
- Google's Vimscript Style Guide:
  - [Vimscript Style Guide](https://google.github.io/styleguide/vimscriptguide.xml)
  - [Vimscript Full Style Guide](https://google.github.io/styleguide/vimscriptfull.xml)
- [No Plugins](https://github.com/changemewtf/no_plugins)
- [Idiomatic Vimrc](https://github.com/romainl/idiomatic-vimrcr)
- [Five Minute Vimscript](http://andrewscala.com/vimscript/)

---

> Any sufficiently complicated set of Vim plugins contains an ad hoc, informally-
> specified, bug-ridden, slow implementation of half of Vim's features.
>
> _robertmeta's tenth rule_
