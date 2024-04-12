" https://github.com/psf/black/blob/main/plugin/black.vim
if exists("g:load_black") || v:version < 700 || !has('python3')
  finish
end

let g:load_black = "py1.0"
let g:black_fast = 0
let g:black_linelength = 88
let g:black_preview = 0
let g:black_quiet = 0
let g:black_skip_magic_trailing_comma = 0
let g:black_skip_string_normalization = 0
let g:black_target_version = ""
let g:black_use_virtualenv = 1
let g:black_virtualenv = "~/.vim/.black"

command! -nargs=* Black :call black#Black(<f-args>)
command! BlackUpgrade :call black#BlackUpgrade()
command! BlackVersion :call black#BlackVersion()
