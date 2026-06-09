function nv -d "nvim alias with remote support" -w nvim
  if test -n "$NVIM"
    nvim --server "$NVIM" --remote $argv
  else
    nvim $argv
  end
end
