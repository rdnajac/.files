# Aliases for AWS S3 commands
alias s3ls='aws s3 ls'
alias s3cp='aws s3 cp'
alias s3rm='aws s3 rm'
alias s3mv='aws s3 mv'
alias s3sync='aws s3 sync'

# exit if not zsh
if [ "${SHELL##*/}" != "zsh" ]; then
  echo "Skipping aws zsh completion setup: not using zsh shell."
  return 1
fi

# Set cache location
mkdir -p "$ZSH_CACHE_DIR/aws-s3"

# Create a function to update the bucket/key cache
s3-refresh-cache() {
  aws s3 ls | awk '{print $3}' > "$ZSH_CACHE_DIR/aws-s3/buckets"
  for b in $(<"$ZSH_CACHE_DIR/aws-s3/buckets"); do
    aws s3 ls "s3://$b/" --recursive | awk '{print $4}' > "$ZSH_CACHE_DIR/aws-s3/$b-keys"
  done
}

# Define the s3 wrapper
s3() {
  aws s3 "$@"
}

# Completion function
_aws_s3_complete() {
  local cur bucket keys_file keys buckets
  cur=${words[CURRENT]}

  if [[ $cur == s3://*/* ]]; then
    bucket="${cur#s3://}"
    bucket="${bucket%%/*}"
    keys_file="$ZSH_CACHE_DIR/aws-s3/${bucket}-keys"
    [[ -f $keys_file ]] || return
    keys=("${(@f)$(<"$keys_file")}")
    compadd -W "s3://$bucket/" -a keys
  elif [[ $cur == s3://* || -z $cur ]]; then
    buckets=("${(@f)$(<"$ZSH_CACHE_DIR/aws-s3/buckets")}")
    compadd -W "s3://" -a buckets
  fi
}

# Register completion for each alias
compdef _aws_s3_complete s3ls
compdef _aws_s3_complete s3cp
compdef _aws_s3_complete s3rm
compdef _aws_s3_complete s3mv
compdef _aws_s3_complete s3sync

# Optional: fuzzy finder for S3 objects
s3fzf() {
  local bucket file
  bucket=$(<"$ZSH_CACHE_DIR/aws-s3/buckets" | fzf --prompt="Choose bucket: ")
  [[ -z $bucket ]] && return

  file=$(<"$ZSH_CACHE_DIR/aws-s3/$bucket-keys" | fzf --prompt="Choose file: ")
  [[ -z $file ]] && return

  echo "s3://$bucket/$file"
}

# Optionally alias s3f to copy path to clipboard
# s3f | pbcopy
# vim: ft=zsh
