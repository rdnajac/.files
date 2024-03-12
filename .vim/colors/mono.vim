" Name:         Simple Monochrome
" Description:  Monochrome Vim colorscheme with a black background and neon green text
" Author:       [Your Name]
" License:      Public Domain

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mono"

" Define colors
let s:background = '#000000'
let s:foreground = '#39FF14'

" Apply colors
execute 'hi Normal guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi NonText guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi LineNr guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi Folded guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi StatusLine guifg=' . s:background . ' guibg=' . s:foreground . ' ctermfg=black ctermbg=green'
execute 'hi StatusLineNC guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi VertSplit guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi CursorLineNr guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'

" Highlight the rest of the elements as normal text
execute 'hi Comment guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi Constant guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi Identifier guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi Statement guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi PreProc guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi Type guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi Special guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi Underlined guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'
execute 'hi Todo guifg=' . s:foreground . ' guibg=' . s:background . ' ctermfg=green ctermbg=black'

" Set terminal colors if applicable
if &termguicolors
  set t_Co=256
  hi Normal ctermfg=green ctermbg=black
  " ...and so on for other elements
endif

" Disable GUI color settings in terminal
if !has('gui_running')
  syntax off
endif

