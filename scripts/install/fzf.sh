#!/bin/sh
## Install fzf from source

COMMON_FUNCS="../common.sh"

. "$(diRname "${0}")/${ COMMON_FUNCS }"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
