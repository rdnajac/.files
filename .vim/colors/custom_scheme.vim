" Set the name of your color scheme
let g:colors_name = "custom_scheme"

" Define colors
let s:bg = '#000000'
let s:fg = '#39ff14'
let s:blue = '#14afff'
let s:magenta = '#ff69ff'

" General UI
exec 'hi Normal guifg='.s:fg.' guibg='.s:bg
exec 'hi Comment guifg='.s:blue.' guibg=NONE'
exec 'hi Constant guifg='.s:magenta.' guibg=NONE'

" Syntax highlighting
exec 'hi Statement guifg='.s:blue.' guibg=NONE'
exec 'hi PreProc guifg='.s:blue.' guibg=NONE'
exec 'hi Type guifg='.s:magenta.' guibg=NONE'
exec 'hi Special guifg='.s:magenta.' guibg=NONE'

" UI Elements
exec 'hi CursorLine guibg=#202020'
exec 'hi LineNr guifg=#505050 guibg='.s:bg
exec 'hi StatusLine guifg='.s:fg.' guibg=#202020'
exec 'hi StatusLineNC guifg=#505050 guibg=#202020'
exec 'hi VertSplit guifg=#505050 guibg='.s:bg
exec 'hi MatchParen guibg=#303030'

" Maintain the reversed settings
exec 'hi! link ColorColumn REVERSED'
exec 'hi! link Conceal REVERSED'
exec 'hi! link Cursor REVERSED'
exec 'hi! link CursorColumn REVERSED'
exec 'hi! link CursorLine REVERSED'
exec 'hi! link CursorLineNr REVERSED'
exec 'hi! link CurSearch REVERSED'
exec 'hi! link IncSearch REVERSED'
exec 'hi! link MatchParen REVERSED'
exec 'hi! link QuickFixLine REVERSED'
exec 'hi! link Search REVERSED'
exec 'hi! link StatusLine REVERSED'
exec 'hi! link StatusLineNC REVERSED'
exec 'hi! link StatusLineTerm REVERSED'
exec 'hi! link StatusLineTermNC REVERSED'
exec 'hi! link Visual REVERSED'
exec 'hi! link VisualNOS REVERSED'

