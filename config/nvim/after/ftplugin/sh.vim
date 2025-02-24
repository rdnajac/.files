" ~/.vim/after/ftplugin/sh.vim
" on an empty file, enter the shebang line
" autocmd BufNewFile *.sh exec "normal! i#!/bin/bash\<CR>\<CR>"

" use shellfmt and shellharden to format shell scripts
setlocal formatexpr=
" setlocal formatprg=shfmt\ -bn\ -sr
" setlocal formatprg=shellharden\ --transform\ <(shfmt\ -bn\ -sr\)
let &l:formatprg = 'shellharden --transform <(shfmt -bn -sr %)'
" Parser options:
"   -ln, --language-dialect str  bash/posix/mksh/bats, default "auto"
"   -p,  --posix                 shorthand for -ln=posix
"
" Printer options:
"   -i,  --indent uint       0 for tabs (default), >0 for number of spaces
"   -bn, --binary-next-line  binary ops like && and | may start a line
"   -ci, --case-indent       switch cases will be indented
"   -sr, --space-redirects   redirect operators will be followed by a space
"   -kp, --keep-padding      keep column alignment paddings
"   -fn, --func-next-line    function opening braces are placed on a separate line

" compiler shellcheck
