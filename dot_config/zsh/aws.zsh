# AWS S3 caching and completion
# Make sure completion is enabled in your .zshrc
# and that the $ZSH_CACHE_DIR is set.

S3_CACHE="$ZSH_CACHE_DIR/aws-s3"
mkdir -p "$S3_CACHE"

# manual refresh
s3-refresh-cache() {
	aws s3 ls | awk '{print $3}' > "$S3_CACHE/buckets" || return
	while read -r bucket; do
		aws s3 ls "s3://$bucket/" --recursive \
			| awk '{$1=$2=$3=""; sub(/^ +/, ""); print}' \
			> "$S3_CACHE/${bucket}-keys"
	done < "$S3_CACHE/buckets"
}

# completion helper
_aws_s3_complete() {
	local cur bucket prefix keyfile keys
	cur=$words[CURRENT]

	if [[ $cur == s3://*/* ]]; then
		bucket=${cur#s3://}; bucket=${bucket%%/*}
		prefix=${cur#*"$bucket/"}
		keyfile=$S3_CACHE/${bucket}-keys
		[[ -r $keyfile ]] || return
		keys=(${(f)"$(<"$keyfile")"})
		compadd -P "s3://$bucket/" -- ${(M)keys:#$prefix*}
	elif [[ $cur == s3://* ]]; then
		compadd -P 's3://' -S '/' ${(f)"$(<"$S3_CACHE/buckets")"}
	fi
}

s3ls()   { aws s3 ls   "$@" }
s3cp()   { aws s3 cp   "$@" }
s3rm()   { aws s3 rm   "$@" }
s3mv()   { aws s3 mv   "$@" }
s3sync() { aws s3 sync "$@" }

compdef _aws_s3_complete s3ls s3cp s3rm s3mv s3sync
