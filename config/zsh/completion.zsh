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

# AWS S3 tab completion
# mkdir -p "$ZSH_CACHE_DIR/aws-s3"
# aws s3 ls | awk '{print $3}' > "$ZSH_CACHE_DIR/aws-s3/buckets"
# for b in $(<"$ZSH_CACHE_DIR/aws-s3/buckets"); do
#   aws s3 ls "s3://$b/" --recursive | awk '{print $4}' > "$ZSH_CACHE_DIR/aws-s3/$b-keys"
# done
_aws_s3_cached_complete() {
  local cur bucket keys_file keys buckets
  cur=${words[CURRENT]}

  if [[ "$cur" == s3://*/* ]]; then
    bucket="${cur#s3://}"
    bucket="${bucket%%/*}"
    keys_file="$ZSH_CACHE_DIR/aws-s3/${bucket}-keys"
    [[ -f $keys_file ]] || return
    keys=("${(@f)$(<"$keys_file")}")
    compadd -W "s3://$bucket/" -a keys
  elif [[ "$cur" == s3://* || -z "$cur" ]]; then
    buckets=("${(@f)$(<"$ZSH_CACHE_DIR/aws-s3/buckets")}")
    compadd -W "s3://" -a buckets
  fi
}

compdef _aws_s3_cached_complete aws-s3c

aws-s3c() {
  aws s3 "$@"
}
