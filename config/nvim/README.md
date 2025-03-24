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

## Resources

- [Neovim](https://neovim.io/)
- [`lazy.nvim` plugin manager](https://lazy.folke.io/)
- [LazyVim](https://www.lazyvim.org)
- [`lsp-zero`](https://lsp-zero.netlify.app/docs/)
- <https://boltless.me/posts/neovim-config-without-plugins-2025/>

---

## Snacks

### text

```sh
l
```

### Image

Equation to do null hypothesis testing:

$$
Z = \frac{\bar{X} - \mu}{\sigma / \sqrt{n}}
$$

> The computing scientist's main challenge is not to get confused
> by the complexities of his own making.

-- _Edsger W. Dijkstra_
