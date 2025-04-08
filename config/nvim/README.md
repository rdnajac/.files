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

## Snacks

### Image

Equation to do null hypothesis testing:

$$
Z = \frac{\bar{X} - \mu}{\sigma / \sqrt{n}}
$$

> [!NOTE]
> This only renders inline in `kitty` terminal.

## TODO

- [ ] Show the full text in `lsp.hover` and not: `...(+43)`
- [ ] wrap oil buffers in smaller floating window borders
- [ ] set formatoptions and formatlistpart for md to includ eboxes and '>'
- [ ] prepend the directoy to backup files so epynomous files aren't overwritten
- [ ] fix table rendering in readme
- [ ] close dashboard whenn picker open



```vim
setlocal formatlistpat+=\\|^\\s*>\\s\\+            " works
setlocal formatlistpat+=\\|^\\s*\\[ \\]\\s\\+      " doesn't work
" formatlistpat=^\s*\d\+\.\s\+\|^\s*[-*+]\s\+\|^\[^\ze[^\]]\+\]:\&^.\{4\}|^\s*>\s\+
```

## blink

- [ ] on `.` (trigger char) hide copilot and show pum


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
