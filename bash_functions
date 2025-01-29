#!/bin/bash

ree() { clear -x && echo -e "(╯°□°)╯︵ ┻━┻" && exec "$SHELL"; }

# clone personal repos with ssh
Clone() { git clone "git@github.com:rdnajac/${1}.git"; }

# browse files over ssh
Oil() { nvim "oil-ssh://${1}/~}"; }
