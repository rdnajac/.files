# FIXME: chezmoi: requires at least 1 arg(s), only received 0
function cza
  if test (count $argv) -eq 0; or string match -qr '^-' $argv[1]
    chezmoi apply $argv
  else
    chezmoi add $argv
  end
end
