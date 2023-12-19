" Name:         My Minimal Colorscheme
" Author:       Ryan D. Najac
" Maintainer:   Ryan D. Najac
" License:      Vim License (see `:help license`)

set background=dark
hi clear
let g:colors_name = 'myminimal'

" Define capabilities - Simplified the conditions for better compatibility
let s:bold = &t_md != '' && &t_me != ''
let s:italics = &t_ZH != '' && &t_ZH != ''

" Define color variables
let s:neongreen = '#39ff14'
let s:myblue = '#14afff'
let s:fuscia = '#ff69ff'
let s:black = '#000000'
let s:eigengrau = '#16161d'
let s:jetblack = '#343434'
let s:bloodred = '#880808'
let s:mypurple = '#6514ff'
let s:gold = '#ffd700'

" Helper function to set highlights
function! SetHighlight(group, fg, bg, gui, cterm, ctermfg, ctermbg)
  let guiStyle = a:gui
  let ctermStyle = a:cterm

  " Apply conditional formatting for bold and italics
  if (a:gui == 'bold' && !s:bold) || (a:gui == 'italic' && !s:italics)
    let guiStyle = 'NONE'
  endif
  if (a:cterm == 'bold' && !s:bold) || (a:cterm == 'italic' && !s:italics)
    let ctermStyle = 'NONE'
  endif

  execute 'hi ' . a:group . ' guifg=' . a:fg . ' guibg=' . a:bg . ' gui=' . guiStyle . ' cterm=' . ctermStyle . ' ctermfg=' . a:ctermfg . ' ctermbg=' . a:ctermbg
endfunction

" Function to link highlight groups
function! LinkGroups(group, targets)
  for target in a:targets
    execute 'hi! link ' . a:group . ' ' . target
  endfor
endfunction
" Expanded function calls for setting highlight groups
call SetHighlight('Normal', s:neongreen, s:black, 'NONE', 'NONE', '46', '16')
call SetHighlight('Comment', s:myblue, 'NONE', 'italic', 'NONE', '39', 'NONE')
call SetHighlight('Identifier', s:fuscia, 'NONE', 'NONE', 'NONE', '207', 'NONE')
call SetHighlight('Statement', s:bloodred, 'NONE', 'NONE', 'NONE', '88', 'NONE')
call SetHighlight('PreProc', s:gold, 'NONE', 'bold', 'NONE', '220', 'NONE')
call SetHighlight('Type', s:mypurple, 'NONE', 'NONE', 'NONE', '57', 'NONE')
call SetHighlight('Special', s:neongreen, 'NONE', 'NONE', 'NONE', '46', 'NONE')
call SetHighlight('Underlined', s:myblue, 'NONE', 'underline', 'NONE', '39', 'NONE')

" Expanded function calls for linking highlight groups
call LinkGroups('Normal', ['CursorLineNr', 'LineNr', 'Folded', 'NonText', 'SpecialKey', 'VertSplit'])
call LinkGroups('Comment', ['Todo', 'Conditional', 'Repeat'])
call LinkGroups('Identifier', ['Function', 'Constant', 'String', 'Character', 'Number', 'Boolean', 'Float'])
call LinkGroups('Statement', ['Label', 'Operator', 'Keyword', 'Exception'])
call LinkGroups('PreProc', ['Include', 'Define', 'Macro', 'PreCondit'])
call LinkGroups('Type', ['StorageClass', 'Structure', 'Typedef'])
call LinkGroups('Special', ['SpecialChar', 'Tag', 'Delimiter', 'Debug'])
call LinkGroups('Underlined', ['Title', 'Question', 'MoreMsg', 'WarningMsg', 'ErrorMsg'])

"" Call function to set highlights
"call SetHighlight('NORMAL', s:neongreen, s:black, 'NONE', 'NONE', '46', '16')
"call SetHighlight('ITALICS', s:neongreen, 'NONE', 'italic', 'italic', '46', 'NONE')
"call SetHighlight('BOLD', s:neongreen, 'NONE', 'NONE', 'bold', '46', 'NONE')
"call SetHighlight('REVERSED', 'NONE', 'NONE', 'reverse', 'reverse', 'NONE', 'NONE')
"
"call SetHighlight('BLUE', s:myblue, 'NONE', 'NONE', 'NONE', '39', 'NONE')
"call SetHighlight('PURPLE', s:mypurple, s:black, 'NONE', 'NONE', '57', '16')
"call SetHighlight('PREPROC', s:fuscia, s:black, 'NONE', 'NONE', '207', '16')
"call SetHighlight('SPECIAL', s:myblue, s:black, 'NONE', 'NONE', '39', '16')
"call SetHighlight('WARNING', s:bloodred, s:gold, 'NONE', 'NONE', '88', '220')
"call SetHighlight('FOLDED', s:neongreen, s:eigengrau, 'NONE', 'NONE', '46', '233')
"
"" Call function to link groups
"call LinkGroups('NORMAL', ['Normal', 'TabLine', 'TabLineFill', 'SignColumn', 'VertSplit'])
"call LinkGroups('ITALICS', ['Comment'])
"call LinkGroups('REVERSED', ['Cursor', 'lCursor', 'StatusLineNC', 'StatusLineTerm', 'StatusLineTermNC', 'Visual', 'ColorColumn', 'Conceal', 'CursorColumn', 'CursorLine', 'CursorLineNr', 'QuickFixLine', 'CurSearch', 'IncSearch', 'Search'])
"call LinkGroups('BLUE', ['Boolean', 'Constant', 'Identifier', 'Character', 'Float', 'Number', 'String'])
"call LinkGroups('PURPLE', ['LineNr', 'NonText'])
"call LinkGroups('PREPROC', ['Define', 'Include', 'Macro', 'PreCondit'])
"call LinkGroups('SPECIAL', ['Debug', 'SpecialChar', 'SpecialComment', 'Tag', 'Delimiter'])
"call LinkGroups('WARNING', ['Todo', 'Error', 'WarningMsg', 'MessageWindow', 'PopupNotification'])
"call LinkGroups('FOLDED', ['CursorLineSign', 'CursorLineFold', 'FoldColumn'])

