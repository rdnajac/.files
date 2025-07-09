# Set cache location
export ZSH_CACHE_DIR="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}"

mkdir -p "$ZSH_CACHE_DIR/aws-s3"

# Update cache: list buckets and keys
s3-refresh-cache() {
	echo "Refreshing S3 bucket list..."
	aws s3 ls | awk '{print $3}' > "$ZSH_CACHE_DIR/aws-s3/buckets" || return
	while read -r bucket; do
		echo "Caching keys for bucket: $bucket"
		aws s3 ls "s3://$bucket/" --recursive | awk '{$1=$2=$3=""; sub(/^ +/, ""); print}' > "$ZSH_CACHE_DIR/aws-s3/$bucket-keys"
	done < "$ZSH_CACHE_DIR/aws-s3/buckets"
	echo "S3 cache refresh complete."
}

# Completion function
_aws_s3_complete() {
	local cur="${words[CURRENT]}"
	if [[ $cur == s3://*/* ]]; then
		local bucket="${cur#s3://}"; bucket="${bucket%%/*}"
		local keyfile="$ZSH_CACHE_DIR/aws-s3/${bucket}-keys"
		[[ -f $keyfile ]] || return
		compadd -W "s3://$bucket/" -- ${(f)"$(<"$keyfile")"}
	elif [[ $cur == s3://* || -z $cur ]]; then
		local buckets_file="$ZSH_CACHE_DIR/aws-s3/buckets"
		[[ -f $buckets_file ]] || return
		compadd -W "s3://" -- ${(f)"$(<"$buckets_file")"}
	fi
}
# Register completions
for alias in s3ls s3cp s3rm s3mv s3sync; do
	compdef _aws_s3_complete $alias
done

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
