# Rust clones

These can all be installed with `cargo install <package>` or,
if on MacOS, with `brew install <package>`.

|                                                   | replaces |
| ------------------------------------------------- | -------- |
| [`bat`](https://github.com/sharkdp/bat)           | `cat`    |
| [`eza`](https://github.com/eza-community/eza)     | `ls`     |
| [`rg`](https://github.com/BurntSushi/ripgrep)  | `grep`   |
| [`fd`](https://github.com/sharkdp/fd)             | `find`   |
| [`btm`](https://github.com/ClementTsang/bottom)   | `htop`   |
| [`zoxide`](https://github.com/ajeetdsouza/zoxide) | `cd`     |
| [`procs`](https://github.com/dalance/procs)       |          |
| [`dust`](https://github.com/bootandy/dust)        | `du`     |


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
