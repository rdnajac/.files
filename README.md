# .files
did you know that you can get quick access to the ascii table with `man ascii`?

## tmux cheatsheet
- `ctrl+b` prefix
- `ctrl+a` also prefix

the following commands are in the form of prefix plus \<key>

| key | command | notes |
| --- | --- |
| `c` | create new window | 
| `n` | next window | 
| `p` | previous window |
| `w` | list windows |
| `d` | detach from session |
| `:` | enter command mode |
| `r` | reload tmux config |
| `&` | kill window |
| `x` | kill pane |
| `z` | zoom pane |
| `h` | move to left pane |
| `j` | move to bottom pane |
| `k` | move to top pane |
| `l` | move to right pane |
| `|` | split pane horizontally |
| `-` | split pane vertically | tmux config has been modified to use `|` and `-` instead of `"` and `%` |


```
sudo apt update && apt-get update && sudo apt upgrade -y

yes | sudo apt install make libncurses-dev build-essential python3 python3-dev python3-pip \
gcc clang clangd clang-format cmake tmux htop ripgrep bat \
net-tools netcat rsync curl wget strace lld mtools
```
