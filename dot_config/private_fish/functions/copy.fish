function copy
  set -q argv[1]; and set file $argv[1]; or set file /dev/stdin

  if type -q pbcopy
    if test "$file" = "/dev/stdin"
      pbcopy
    else
      cat "$file" | pbcopy
    end
  else if type -q xclip
    if test "$file" = "/dev/stdin"
      xclip -sel clip
    else
      cat "$file" | xclip -sel clip
    end
  else
    printf "\033[0;31mNo clipboard utility found\033[0m\n"
    return 1
  end

  printf "\033[0;31mCopied contents of %s to clipboard\033[0m\n" "$file"
end
