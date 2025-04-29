# Set fpath early to include homebrew-managed completions
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

# Enable zsh native completion
autoload -Uz compinit
compinit

# SCP specific tweaks
zstyle ':completion:*:*:scp:*' tag-order files
zstyle ':completion:*:scp:*' remote-access yes
# zstyle ':completion:*:*:(scp|rsync):*' tag-order files
# zstyle ':completion:*:(scp|rsync):*' remote-access yes

# Completion caching for speed
# Follow XDG Base Directory spec for cache
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# Create if missing
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir -p "$ZSH_CACHE_DIR"

# Tell completion system to cache there
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# (Optional) Enable bashcompinit only if needed
# Only if you later need bash-style `complete -C` for some weird CLI tools
# autoload -Uz bashcompinit
# bashcompinit
