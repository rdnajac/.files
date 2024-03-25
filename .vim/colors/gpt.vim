
" Vim colorscheme: gpt.vim
" Description: GPT-inspired colorscheme with a background change

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "gpt"

" General colors
hi Normal       guifg=#C5C8C6 guibg=#000000
hi Comment      guifg=#969896 guibg=#000000
hi Constant     guifg=#DE935F
hi Identifier   guifg=#F0C674
hi Statement    guifg=#81A2BE
hi PreProc      guifg=#8ABEB7
hi Type         guifg=#B5BD68
hi Special      guifg=#B294BB
hi Underlined   guifg=#CC6666 gui=underline
hi Ignore       guifg=#C5C8C6 guibg=#000000
hi Error        guifg=#CC6666 guibg=#373b41

" More specific highlights can be added based on preference
