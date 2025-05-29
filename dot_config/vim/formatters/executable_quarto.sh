#!/bin/sh
# Format Quarto (QMD) content from stdin using styler and output to stdout

tmpfile="$(mktemp)"
trap 'rm -rf "${tmpfile}"' EXIT
cat > "$tmpfile"
Rscript --vanilla -e "suppressMessages(styler::style_file('$tmpfile'))" >/dev/null 2>&1
cat "$tmpfile"

# 2. migrate to a minimal LazyVim
# 4. nvim terminal settings
#
# LazyVim for conform and lang stuff
