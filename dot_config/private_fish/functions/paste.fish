function paste
  set -q argv[1]; and set file $argv[1]; or set file /dev/stdout

  if type -q pbpaste
    if test "$file" = "/dev/stdout"
      pbpaste
    else
      pbpaste | cat > "$file"
    end
  else if type -q xclip
    if test "$file" = "/dev/stdout"
      xclip -sel clip -o
    else
      xclip -sel clip -o | cat > "$file"
    end
  else
    printf "\033[0;31mNo clipboard utility found\033[0m\n"
    return 1
  end

  printf "\033[0;31mPasted contents of clipboard to %s\033[0m\n" "$file"
end
