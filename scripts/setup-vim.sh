#!/bin/bash
sudo apt update
sudo apt-get update
sudo apt upgrade -y

yes | sudo apt install make libncurses-dev build-essential python3 python3-dev python3-pip \
gcc clang clangd clang-format cmake tmux htop ripgrep bat \
net-tools netcat rsync curl wget strace lld mtools

# install additional manual pages
sudo apt-get install man-db manpages-dev 
#manpages-posix manpages-posix-dev

#git config --global user.email "rdn2108@columbia.edu"
#git config --global user.name "Ryan David Najac"

#clone vim - make sure to enable python and cscope (and disable gui)
git clone git@github.com:vim/vim.git

#make symlinks
#ln -s 

#
