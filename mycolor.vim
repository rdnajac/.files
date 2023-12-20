" Name:         My Minimal Colorscheme
" Author:       Ryan D. Najac
" License:      Vim License (see `:help license`)

set background=dark
hi clear
let g:colors_name = 'mycolor'

" Check if GUI is running or if terminal supports true colors
let s:gui_running = has('gui_running')
let s:termguicolors = (has('termguicolors') && &termguicolors)
let s:supports_true_colors = s:gui_running || s:termguicolors

" Function to define highlight groups
function! Def_hi(group, fg, bg, attrs)
  execute 'hi ' . a:group . ' guifg=' . a:fg . ' guibg=' . a:bg . ' gui=' . a:attrs . ' cterm=' . a:attrs
endfunction

call Def_hi('Normal', '#39ff14', '#000000', 'NONE')
call Def_hi('KEYWORD', '#14afff', '#000000', 'NONE')
call Def_hi('Special', '#ff6414', '#000000', 'NONE')
call Def_hi('WARN', '#ff6414', '#ff6969', 'NONE')

call Def_hi('Comment', '#da14ff', 'NONE', 'italic')

call Def_hi('NonText', '#da14ff', '#000000', 'NONE')
call Def_hi('Underlined', '#39ff14', '#000000', 'NONE')
call Def_hi('REVERSED', 'NONE', '#000000', 'reverse')

call Def_hi('LINES', '#1439ff', 'NONE', 'NONE')
call Def_hi('FOLD', '#39ff14', '#404040', 'NONE')
call Def_hi('MENU', '#39ff14', '#404040', 'NONE')
call Def_hi('SELECTION', '#39ff14', '#da14ff', 'NONE')


" Function to link a highlight group to multiple groups
function! Link_hi(target_group, group_names)
  for group in a:group_names
    execute 'hi! link ' . group . ' ' . a:target_group
  endfor
endfunction

" Define and process highlight group links
call Link_hi('Normal', ['Constant', 'SignColumn', 'TabLine', 'TabLineFill', 'VertSplit', 'ToolbarLine', 'Title'])
call Link_hi('Constant', ['Boolean', 'Character', 'Float', 'Number', 'String'])

call Link_hi('KEYWORD', ['PreProc', 'Identifier'])
call Link_hi('PreProc', ['Define', 'Include', 'Macro', 'PreCondit'])
call Link_hi('Special', ['SpecialKey', 'Delimiter', 'Debug', 'SpecialChar', 'SpecialComment', 'Tag'])
call Link_hi('Identifier', ['Directory', 'Function', 'lCursor', 'CursorIM'])

call Link_hi('NonText', ['EndOfBuffer', 'Ignore'])

call Link_hi('LINES', ['LineNr', 'LineNrAbove', 'LineNrBelow'])
call Link_hi('FOLD', ['Folded', 'CursorLineFold', 'CursorLineSign', 'FoldColumn'])
call Link_hi('MENU', ['WildMenu', 'PmenuExtra', 'PmenuKind', 'PmenuSbar', 'PmenuThumb'])
call Link_hi('SELECTION', ['PmenuExtraSel', 'PmenuKindSel', 'PmenuSel', 'PopupSelected'])

call Link_hi('REVERSED', ['ColorColumn', 'Conceal', 'Cursor', 'CursorColumn', 'CursorLine', 'CursorLineNr', 'CurSearch', 'IncSearch'])
call Link_hi('REVERSED', ['MatchParen', 'QuickFixLine', 'Search', 'StatusLine', 'StatusLineNC', 'StatusLineTerm', 'StatusLineTermNC', 'Visual', 'VisualNOS'])

call Link_hi('WARN', ['MessageWindow', 'PopupNotification', 'Todo', 'WarningMsg', 'Error', 'ErrorMsg', 'Question', 'debugBreakpoint', 'debugPC'])
call Link_hi('WARN', ['DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText', 'SpellBad', 'SpellCap', 'SpellLocal', 'SpellRare'])

" Check for GUI and terminal color capability
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

