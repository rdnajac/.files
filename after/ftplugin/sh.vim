" ~/.vim/after/ftplugin/sh.vim

"on an empty file, enter the shebang !#/bin/bash<CR><CR> and stay in insert
" autocmd BufNewFile *.sh exec "normal! i#!/bin/bash\<CR>\<CR>"

" inoremap <buffer> bbb #!/bin/bash<CR>

" use shellfmt and shellharden to format shell scripts
" setlocal formatprg=shellharden\ --transform\ <(shfmt\ -bn\ -sr\ %)
setlocal formatexpr=
setlocal formatprg=shfmt\ -bn\ -sr

"   -l,  --list      list files whose formatting differs from shfmt's
"   -w,  --write     write result to file instead of stdout
"   -d,  --diff      error with a diff when the formatting differs
"   -s,  --simplify  simplify the code
"   -mn, --minify    minify the code to reduce its size (implies -s)
"   --apply-ignore   always apply EditorConfig ignore rules
"   --filename str   provide a name for the standard input file
"
" Parser options:
"
"   -ln, --language-dialect str  bash/posix/mksh/bats, default "auto"
"   -p,  --posix                 shorthand for -ln=posix
"
" Printer options:
"
"   -i,  --indent uint       0 for tabs (default), >0 for number of spaces
"   -bn, --binary-next-line  binary ops like && and | may start a line
"   -ci, --case-indent       switch cases will be indented
"   -sr, --space-redirects   redirect operators will be followed by a space
"   -kp, --keep-padding      keep column alignment paddings
"   -fn, --func-next-line    function opening braces are placed on a separate line
" Utilities:
"
"   -f, --find   recursively find all shell files and print the paths
"   --to-json    print syntax tree to stdout as a typed JSON
"   --from-json  read syntax tree from stdin as a typed JSON
"

" compiler shellcheck
