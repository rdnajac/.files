function copy
  set file ${argv[1]:-/dev/stdin}
  if command -v pbcopy &>/dev/null
    pbcopy < "$file"
  else if command -v xclip &>/dev/null
    xclip -sel clip < "$file"
  else
    printf "\033[0;31mNo clipboard utility found\033[0m\n"
    return 1
  end
  printf "\033[0;31mCopied contents of %s to clipboard\033[0m\n" "$file"
end
