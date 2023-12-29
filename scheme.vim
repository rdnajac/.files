" Name:         My Minimal Colorscheme
" Author:       Ryan D. Najac
" License:      Vim License (see `:help license`)

set background=dark
hi clear
let g:colors_name = 'scheme'

" Check if GUI is running or if terminal supports true colors
let s:gui_running = has('gui_running')
let s:termguicolors = (has('termguicolors') && &termguicolors)
let s:supports_true_colors = s:gui_running || s:termguicolors

" Function to define highlight groups
function! Def(group, fg, bg, attrs)
  execute 'hi ' . a:group . ' guifg=' . a:fg . ' guibg=' . a:bg . ' gui=' . a:attrs . ' cterm=' . a:attrs
endfunction

" Function to link a highlight group to multiple groups
function! Link(target_group, group_names)
  for group in a:group_names
    execute 'hi! link ' . group . ' ' . a:target_group
  endfor
endfunction

" Define named colors
let s:black = '#000000'
let s:neongreen = '#39FF14'

let s:norm = s:neongreen
let s:const = '#808080'
let s:prpr = '#FF7F50'
let s:id = '#00BFFF'
let s:state = '#6B8E23'

" Define and link Normal
call Def('Normal', s:norm, s:black, 'NONE')
call Link('Normal', ['SignColumn', 'TabLine', 'TabLineFill', 'VertSplit', 'ToolbarLine', 'Title'])
call Def('Comment', s:norm, 'NONE', 'italic')
call Def('Underlined', s:norm, s:black, 'underline')
call Def('NonText', '#da14ff', s:black, 'NONE')
call Link('NonText', ['EndOfBuffer', 'Ignore'])

" Define and process highlight group links
call Def('Constant', s:const, s:black, 'NONE')
call Link('Constant', ['Boolean', 'Character', 'Float', 'Number', 'String'])
call Def('PreProc', s:prpr, s:black, 'NONE')
call Link('PreProc', ['Define', 'Include', 'Macro', 'PreCondit'])
call Def('Identifier', s:id, s:black, 'NONE')
call Link('Identifier', ['Directory', 'Function', 'lCursor', 'CursorIM'])
call Def('Statement', s:state, s:black, 'NONE')
call Link('Statement', ['Conditional', 'Exception', 'Keyword', 'Label', 'Operator', 'Repeat'])
call Def('Special', '#ff6414', s:black, 'NONE')
call Link('Special', ['SpecialKey', 'Delimiter', 'Debug', 'SpecialChar', 'SpecialComment', 'Tag'])

" GUI {{{
call Def('LINES', '#1439ff', 'NONE', 'NONE')
call Link('LINES', ['LineNr', 'LineNrAbove', 'LineNrBelow'])

call Def('MENU', s:norm, '#404040', 'NONE')
call Link('MENU', ['WildMenu', 'PmenuExtra', 'PmenuKind', 'PmenuSbar', 'PmenuThumb'])
call Link('MENU', ['Folded', 'CursorLineFold', 'CursorLineSign', 'FoldColumn'])

call Def('SELECTION', '#39ff14', '#da14ff', 'NONE')
call Link('SELECTION', ['PmenuExtraSel', 'PmenuKindSel', 'PmenuSel', 'PopupSelected'])

call Def('REVERSED', 'NONE', s:black, 'reverse')
call Link('REVERSED', ['ColorColumn', 'Conceal', 'Cursor', 'CursorColumn', 'CursorLine', 'CursorLineNr', 'CurSearch', 'IncSearch'])
call Link('REVERSED', [ 'QuickFixLine', 'Search', 'StatusLine', 'StatusLineNC', 'StatusLineTerm', 'StatusLineTermNC', 'Visual', 'VisualNOS'])

call Def('WARN', '#ff6414', s:black, 'NONE')
call Link('WARN', ['MessageWindow', 'PopupNotification', 'Todo', 'WarningMsg', 'Error', 'ErrorMsg', 'Question', 'debugBreakpoint', 'debugPC'])
call Link('WARN', ['DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText', 'SpellBad', 'SpellCap', 'SpellLocal', 'SpellRare'])

call Def('MatchParen', '#ff6414', s:norm, 'NONE')
" }}}

" Check for GUI and terminal color capability {{{
if s:supports_true_colors
  " Set cterm colors if the terminal supports 256 colors
  if &t_Co >= 256
    hi Normal ctermfg=46 ctermbg=16 cterm=NONE
    hi Comment ctermfg=252 ctermbg=NONE cterm=italic
    hi Underlined ctermfg=46 ctermbg=16 cterm=NONE
    hi Constant ctermfg=165 ctermbg=16 cterm=NONE
    hi PreProc ctermfg=214 ctermbg=16 cterm=NONE
    hi Special ctermfg=214 ctermbg=16 cterm=NONE
    hi Identifier ctermfg=39 ctermbg=NONE cterm=NONE
    hi BOLD ctermfg=46 ctermbg=NONE cterm=bold
    hi LINES ctermfg=238 ctermbg=NONE cterm=NONE
    hi WARN ctermfg=202 ctermbg=226 cterm=NONE
    hi REVERSED ctermfg=NONE ctermbg=16 cterm=reverse
    hi MENU ctermfg=46 ctermbg=238 cterm=NONE
    hi SELECTION ctermfg=46 ctermbg=165 cterm=NONE
    hi PURPLE ctermfg=165 ctermbg=16 cterm=NONE
    hi FOLD ctermfg=46 ctermbg=238 cterm=NONE
    hi NONE ctermfg=16 ctermbg=16 cterm=NONE

    " Disable italics if not supported
    if (&t_ZH == '' || &t_ZR == '')
      hi Comment cterm=NONE
    endif
  endif

  " Clean up variables
  unlet s:gui_running s:termguicolors s:supports_true_colors
endif
" }}}

