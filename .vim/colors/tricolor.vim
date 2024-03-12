" custom_scheme.vim
" Neovim colorscheme based on specified colors

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "custom_scheme"

" Define colors
let s:bg = '#000000'
let s:fg = '#39ff14'
let s:blue = '#14afff'
let s:magenta = '#ff69ff'

" General UI
highlight Normal guifg=s:fg guibg=s:bg
highlight Comment guifg=s:blue
highlight Constant guifg=s:magenta

" Syntax highlighting
highlight Statement guifg=s:blue
highlight PreProc guifg=s:blue
highlight Type guifg=s:magenta
highlight Special guifg=s:magenta

" UI Elements
highlight CursorLine guibg=#202020
highlight LineNr guifg=#505050 guibg=s:bg
highlight StatusLine guifg=s:fg guibg=#202020
highlight StatusLineNC guifg=#505050 guibg=#202020
highlight VertSplit guifg=#505050 guibg=s:bg
highlight MatchParen guibg=#303030

" More elements can be customized as needed

