" Name:         My Simple Colorscheme
" Author:       Me
" Maintainer:   Me
" License:      Vim License (see `:help license`)
" Last Updated: Tue Dec 19 12:09:10 2023

" Generated by Colortemplate v2.2.3

set background=dark

hi clear
let g:colors_name = 'simple'

let s:t_Co = has('gui_running') ? -1 : (&t_Co ?? 0)
let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running')

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#16161d', '#16161d', '#16161d', '#16161d', '#16161d', '#16161d', '#16161d', '#16161d', '#39ff14', '#39ff14', '#39ff14', '#39ff14', '#39ff14', '#39ff14', '#39ff14', '#39ff14']
endif
hi bolded guifg=#39ff14 guibg=NONE gui=NONE cterm=bold
hi lines guifg=#6514ff guibg=NONE gui=NONE cterm=NONE
hi Normal guifg=#39ff14 guibg=#000000 gui=NONE cterm=NONE
hi Comment guifg=#39ff14 guibg=NONE gui=NONE cterm=italic
hi Error guifg=#880808 guibg=#ffd700 gui=NONE cterm=NONE
hi Todo guifg=#880808 guibg=#ffd700 gui=NONE cterm=NONE
hi! link Boolean Constant
hi! link Character Constant
hi! link Float Constant
hi! link Number Constant
hi! link String Constant
hi Constant guifg=#14afff guibg=NONE gui=NONE cterm=NONE
hi! link Conditional Statement
hi! link Exception Statement
hi! link Keyword Statement
hi! link Label Statement
hi! link Operator Statement
hi! link Repeat Statement
hi! link Statement bolded
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type
hi! link Type bolded
hi! link Function Identifier
hi Identifier guifg=#14afff guibg=NONE gui=NONE cterm=NONE
hi! link Debug Special
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link Tag Special
hi! link Delimiter Special
hi Special guifg=#14afff guibg=#000000 gui=NONE cterm=NONE
hi! link Define PreProc
hi! link Include PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc
hi PreProc guifg=#ff69ff guibg=#000000 gui=NONE cterm=NONE
hi! link PmenuKind Pmenu
hi! link PmenuExtra Pmenu
hi! link PmenuKindSel PmenuSel
hi! link PmenuExtraSel PmenuSel
hi! link PopupSelected PmenuSel
hi Pmenu guifg=#39ff14 guibg=#343434 gui=NONE cterm=NONE
hi PmenuSel guifg=#39ff14 guibg=#6514ff gui=NONE cterm=NONE
hi! link TabLine normal
hi! link TabLineFill normal
hi! link SignColumn normal
hi! link StatusLineNC reversed
hi! link StatusLineTerm reversed
hi! link StatusLineTermNC reversed
hi! link StatusLine reversed
hi! link Visual reversed
hi! link ColorColumn reversed
hi! link Conceal reversed
hi! link CursorColumn reversed
hi! link CursorLine reversed
hi! link CursorLineNr reversed
hi! link QuickFixLine reversed
hi! link CurSearch reversed
hi! link IncSearch reversed
hi! link Search reversed
hi reversed guifg=NONE guibg=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
hi! link CursorLineSign Folded
hi! link CursorLineFold Folded
hi! link FoldColumn Folded
hi ToolbarButton guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi! link MessageWindow WarningMsg
hi! link PopupNotification WarningMsg
hi WarningMsg guifg=#880808 guibg=#000000 gui=NONE cterm=NONE
hi! link lCursor Cursor
hi VertSplit guifg=#39ff14 guibg=#000000 gui=NONE cterm=NONE
hi Folded guifg=#39ff14 guibg=#16161d gui=NONE cterm=NONE
hi LineNr guifg=#6514ff guibg=#000000 gui=NONE cterm=NONE

if s:t_Co >= 256
  hi bolded ctermfg=46 ctermbg=NONE cterm=bold
  hi lines ctermfg=57 ctermbg=NONE cterm=NONE
  hi Normal ctermfg=46 ctermbg=16 cterm=NONE
  hi Comment ctermfg=46 ctermbg=NONE cterm=italic
  hi Error ctermfg=88 ctermbg=220 cterm=NONE
  hi Todo ctermfg=88 ctermbg=220 cterm=NONE
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Float Constant
  hi! link Number Constant
  hi! link String Constant
  hi Constant ctermfg=39 ctermbg=NONE cterm=NONE
  hi! link Conditional Statement
  hi! link Exception Statement
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Operator Statement
  hi! link Repeat Statement
  hi! link Statement bolded
  hi! link StorageClass Type
  hi! link Structure Type
  hi! link Typedef Type
  hi! link Type bolded
  hi! link Function Identifier
  hi Identifier ctermfg=39 ctermbg=NONE cterm=NONE
  hi! link Debug Special
  hi! link SpecialChar Special
  hi! link SpecialComment Special
  hi! link Tag Special
  hi! link Delimiter Special
  hi Special ctermfg=39 ctermbg=16 cterm=NONE
  hi! link Define PreProc
  hi! link Include PreProc
  hi! link Macro PreProc
  hi! link PreCondit PreProc
  hi PreProc ctermfg=207 ctermbg=16 cterm=NONE
  hi! link PmenuKind Pmenu
  hi! link PmenuExtra Pmenu
  hi! link PmenuKindSel PmenuSel
  hi! link PmenuExtraSel PmenuSel
  hi! link PopupSelected PmenuSel
  hi Pmenu ctermfg=46 ctermbg=236 cterm=NONE
  hi PmenuSel ctermfg=46 ctermbg=57 cterm=NONE
  hi! link TabLine normal
  hi! link TabLineFill normal
  hi! link SignColumn normal
  hi! link StatusLineNC reversed
  hi! link StatusLineTerm reversed
  hi! link StatusLineTermNC reversed
  hi! link StatusLine reversed
  hi! link Visual reversed
  hi! link ColorColumn reversed
  hi! link Conceal reversed
  hi! link CursorColumn reversed
  hi! link CursorLine reversed
  hi! link CursorLineNr reversed
  hi! link QuickFixLine reversed
  hi! link CurSearch reversed
  hi! link IncSearch reversed
  hi! link Search reversed
  hi reversed ctermfg=NONE ctermbg=NONE cterm=reverse
  hi! link CursorLineSign Folded
  hi! link CursorLineFold Folded
  hi! link FoldColumn Folded
  hi ToolbarButton ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
  hi! link MessageWindow WarningMsg
  hi! link PopupNotification WarningMsg
  hi WarningMsg ctermfg=88 ctermbg=16 cterm=NONE
  hi! link lCursor Cursor
  hi VertSplit ctermfg=46 ctermbg=16 cterm=NONE
  hi Folded ctermfg=46 ctermbg=233 cterm=NONE
  hi LineNr ctermfg=57 ctermbg=16 cterm=NONE
  if !s:italics
    hi Comment cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

" Background: dark
" Color: white 		#ffffff ~
" Color: black            #000000 ~
" Color: eigengrau  	#16161d ~
" Color: neongreen 	#39ff14 ~
" Color: mypurple      	#6514FF ~
" Color: myblue  		#14AFFF ~ 
" Color: fuscia     	#ff69ff ~
" Color: jetblack        	#343434 ~
" Color: palegreen 	#98FB98 ~
" Color: bloodred 	#880808 ~ 
" Color: gold 		#FFD700 ~
" Term colors: eigengrau eigengrau eigengrau eigengrau
" Term colors: eigengrau eigengrau eigengrau eigengrau
" Term colors: neongreen neongreen neongreen neongreen
" Term colors: neongreen neongreen neongreen neongreen
" vim: et ts=8 sw=2 sts=2
