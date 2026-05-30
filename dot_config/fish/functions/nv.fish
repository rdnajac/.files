function nv
  if test -n "$NVIM"
    nvim --server "$NVIM" --remote $argv
  else
    nvim $argv
  end
end
