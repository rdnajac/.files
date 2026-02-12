function paste
  set file ${argv[1]:-/dev/stdout}
  if command -v pbpaste &>/dev/null
    pbpaste > "$file"
  else if command -v xclip &>/dev/null
    xclip -sel clip -o > "$file"
  else
    printf "\033[0;31mNo clipboard utility found\033[0m\n"
    return 1
  end
  printf "\033[0;31mPasted contents of clipboard to %s\033[0m\n" "$file"
end
