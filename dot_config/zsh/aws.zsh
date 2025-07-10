# AWS S3 caching and completion {{{

# Cache directories
ZSH_CACHE_DIR="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}"
S3_CACHE="$ZSH_CACHE_DIR/aws-s3"
mkdir -p "$S3_CACHE"

# Cache update function
s3-refresh-cache() {
	echo "Refreshing S3 cache..."
	aws s3 ls | awk '{print $3}' > "$S3_CACHE/buckets" || return
	while read -r bucket; do
		echo "Caching keys for: $bucket"
		aws s3 ls "s3://$bucket/" --recursive \
			| awk '{$1=$2=$3=""; sub(/^ +/, ""); print}' \
			> "$S3_CACHE/${bucket}-keys"
	done < "$S3_CACHE/buckets"
	echo "Done."
}

# Completion helper
_aws_s3_complete() {
	local cur="${words[CURRENT]}"
	if [[ "$cur" == s3://*/* ]]; then
		local bucket="${cur#s3://}"; bucket="${bucket%%/*}"
		local keyfile="$S3_CACHE/${bucket}-keys"
		[[ -r $keyfile ]] || return
		compadd -W "s3://$bucket/" -- ${(f)"$(<"$keyfile")"}
	elif [[ "$cur" == s3://* || -z "$cur" ]]; then
		local buckets_file="$S3_CACHE/buckets"
		[[ -r $buckets_file ]] || return
		compadd -W "s3://" -- ${(f)"$(<"$buckets_file")"}
	fi
}

# Register for s3 aliases
compdef _aws_s3_complete s3cp s3ls s3rm s3mv s3sync

# fzf helper
s3fzf() {
	local bucket file
	bucket=$(<"$S3_CACHE/buckets" fzf --prompt="Bucket: ") || return
	file=$(<"$S3_CACHE/${bucket}-keys" fzf --prompt="File: ") || return
	echo "s3://$bucket/$file"
}

# Optionally alias s3f to copy path to clipboard
# s3f | pbcopy

# }}}
