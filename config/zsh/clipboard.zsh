copy() {
    echo "copy called with arguments: $@"
    pbcopy < "${1:-/dev/stdin}"
    printf "\033[0;31mCopied contents of %s to clipboard\033[0m\n" "${1:-/dev/stdin}"
}

paste() {
    echo "paste called with arguments: $@"
    pbpaste > "${1:-/dev/stdout}"
    printf "\033[0;31mPasted contents of clipboard to %s\033[0m\n" "${1:-/dev/stdout}"
}
