# .files
did you know that you can get quick access to the ascii table with `man ascii`?

## fun with brace expansion
```bash
mv file{,.old}  # add an extension
mv file{,.}old  # hide a file
mv file.{old,new}  # "convert" a file
```

## bash
| command | description |
| --- | --- |
| `!!` | repeat last command |
| `!$` | last argument of last command |
| `!^` | first argument of last command |
| `!-n` | nth command in history |
| `!n` | nth command in history |


### font 
- [`JetBrainsMono`](https://github.com/JetBrains/JetBrainsMono)

- download a patched version of JetBrainsMono from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures/Regular)

- note: iTerm2 supports ligatures, but Alacritty does not


## tmux cheatsheet
- `ctrl+b` prefix
- `ctrl+a` prefix2
apparently both of these conflict with bash and vim


| prefix + \<key> | command |
| --- | --- |
| `d` | detach | detach from session |
| `w` | list windows |
| `:` | enter command mode |
| `&` | kill window |
| `x` | kill pane |
| `r` | reload tmux config (see: `~/.tmux.conf`) |
| `-` | `unbind %` and `bind - split-window -v` |
| `\|` | `unbind '"'` and `bind \| split-window -h` | 


```
# This is not up to date.
sudo apt update && apt-get update && sudo apt upgrade -y

yes | sudo apt install make libncurses-dev build-essential python3 python3-dev python3-pip \
gcc clang clangd clang-format cmake tmux htop ripgrep bat \
net-tools netcat rsync curl wget strace lld mtools
```


