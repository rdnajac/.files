#!/bin/sh

# Load common functions within the parent directory
. "$(dirname "${0}")/../common.sh"

info 'loading common functions...'

# cd to a non-existent directory
cd_or_die not_a_dir
