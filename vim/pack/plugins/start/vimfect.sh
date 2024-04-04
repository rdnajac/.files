# a simple script to manage vim plugins as git submodules
here=$(dirname "${BASH_SOURCE[0]}");
echo $here
vimfect() (
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
  if [ $# -eq 0 ]; then
    echo "$0 is syncing vim plugins..."
    git submodule sync && git submodule update --init --recursive
  else
    if git submodule add "https://github.com/$1.git" 
        echo "$0 successfully added $1 as a submodule"; 
     else echo "error adding $1"; fi fi
)
vimfect "$@"

