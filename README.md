# .files
did you know that you can get quick access to the ascii table with `man ascii`?

## tmux cheatsheet
- `ctrl+b` prefix
- `ctrl+a` also prefix
the following commands are in the form of prefix plus <command>
| command | description |
| --- | --- |
| `c` | create new window |
| `n` | next window |
| `p` | previous window |
| `w` | list windows |
| `d` | detach from session |
| `:` | enter command mode |
| `r` | reload tmux config |



```
sudo apt update
sudo apt-get update
sudo apt upgrade -y

yes | sudo apt install make libncurses-dev build-essential python3 python3-dev python3-pip \
gcc clang clangd clang-format cmake tmux htop ripgrep bat \
net-tools netcat rsync curl wget strace lld mtools

#git config --global user.email "rdn2108@columbia.edu"
#git config --global user.name "Ryan David Najac"

#clone vim - make sure to enable python and cscope (and disable gui)
git clone git@github.com:vim/vim.git
```

setup ycm
```
[12:49:46] ~/.files/scripts ₽ cat ycm-setup.sh
cd ~/.vim/plugged/YouCompleteMe
git submodule update --init --recursive
./install.py --clangd-completer
```
