# .files
did you know that you can get quick access to the ascii table with `man ascii`?

```sh 
# check these out
 brew install bash-doc
```

### font 
- [`JetBrainsMono`](https://github.com/JetBrains/JetBrainsMono)

- download a patched version of JetBrainsMono from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures/Regular)

- note: iTerm2 supports ligatures, but Alacritty does not


## tmux cheatsheet
- `ctrl+b` prefix
- `ctrl+a` also prefix

the following commands are in the form of prefix plus \<key>

| key | command | notes |
| --- | --- | ---
| `d` | detach | detach from session |
| `w` | list windows |
| `:` | enter command mode |
| `r` | reload tmux config |
| `&` | kill window |
| `x` | kill pane |
| `\|` | split pane "horizontally" | `unbind '"'` and `bind \| split-window -h` | 
| `-` | split pane "vertically" | `unbind %` and `bind - split-window -v` |


```
# This is not up to date.
sudo apt update && apt-get update && sudo apt upgrade -y

yes | sudo apt install make libncurses-dev build-essential python3 python3-dev python3-pip \
gcc clang clangd clang-format cmake tmux htop ripgrep bat \
net-tools netcat rsync curl wget strace lld mtools
```


