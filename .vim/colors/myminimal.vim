set background=dark

hi clear
let g:colors_name = 'myminimal'

let s:t_Co = has('gui_running') ? -1 : (&t_Co ?? 0)
let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running')

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#000000', '#ffffff', '#39ff14', '#14afff', '#da14ff', '#ff6414', '#404040', '#d0d0d0', '#1e7f0a', '#add8e6', '#9932cc', '#ffa500', '#ff0000', '#0000ff', '#ffff00', '#00008b']
endif
hi Normal guifg=#39ff14 guibg=#000000 gui=NONE cterm=NONE
hi Comment guifg=#d0d0d0 guibg=NONE gui=NONE cterm=italic
hi Underlined guifg=#39ff14 guibg=#000000 gui=NONE cterm=NONE
hi Constant guifg=#da14ff guibg=#000000 gui=NONE cterm=NONE
hi PreProc guifg=#ffa500 guibg=#000000 gui=NONE cterm=NONE
hi Special guifg=#ffa500 guibg=#000000 gui=NONE cterm=NONE
hi Identifier guifg=#14afff guibg=NONE gui=NONE cterm=NONE
hi BOLD guifg=#39ff14 guibg=NONE gui=NONE cterm=bold
hi LINES guifg=#404040 guibg=NONE gui=NONE cterm=NONE
hi WARN guifg=#ff6414 guibg=#ffff00 gui=NONE cterm=NONE
hi REVERSED guifg=NONE guibg=#000000 gui=reverse cterm=reverse
hi MENU guifg=#39ff14 guibg=#404040 gui=NONE cterm=NONE
hi SELECTION guifg=#39ff14 guibg=#da14ff gui=NONE cterm=NONE
hi PURPLE guifg=#da14ff guibg=#000000 gui=NONE cterm=NONE
hi FOLD guifg=#39ff14 guibg=#404040 gui=NONE cterm=NONE
hi NONE guifg=#000000 guibg=#000000 gui=NONE cterm=NONE
hi! link ColorColumn REVERSED
hi! link Conceal REVERSED
hi! link Cursor REVERSED
hi! link CursorColumn REVERSED
hi! link CursorLine REVERSED
hi! link CursorLineNr REVERSED
hi! link CurSearch REVERSED
hi! link IncSearch REVERSED
hi! link MatchParen REVERSED
hi! link QuickFixLine REVERSED
hi! link Search REVERSED
hi! link StatusLine REVERSED
hi! link StatusLineNC REVERSED
hi! link StatusLineTerm REVERSED
hi! link StatusLineTermNC REVERSED
hi! link Visual REVERSED
hi! link VisualNOS REVERSED
hi! link Folded FOLD
hi! link CursorLineFold Folded
hi! link CursorLineSign Folded
hi! link FoldColumn Folded
hi! link MessageWindow WARN
hi! link PopupNotification WARN
hi! link Todo WARN
hi! link WarningMsg WARN
hi! link Error WARN
hi! link ErrorMsg WARN
hi! link Question WARN
hi! link WildMenu MENU
hi! link PmenuExtra MENU
hi! link PmenuKind MENU
hi! link PmenuExtraSel SELECTION
hi! link PmenuKindSel SELECTION
hi! link PmenuSel SELECTION
hi! link PopupSelected SELECTION
hi! link PmenuSbar MENU
hi! link PmenuThumb MENU
hi! link LineNr LINES
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link NonText PURPLE
hi! link EndOfBuffer NonText
hi! link Ignore NonText
hi! link SignColumn Normal
hi! link TabLine Normal
hi! link TabLineFill Normal
hi! link VertSplit Normal
hi! link ToolbarButton BOLD
hi! link ToolbarLine Normal
hi! link Directory Identifier
hi! link SpecialKey Special
hi! link ModeMsg MENU
hi! link MoreMsg MENU
hi! link TabLineSel SELECTION
hi! link Title Normal
hi! link Boolean Constant
hi! link Character Constant
hi! link Float Constant
hi! link Number Constant
hi! link String Constant
hi! link Conditional Statement
hi! link Exception Statement
hi! link Keyword Statement
hi! link Label Statement
hi! link Operator Statement
hi! link Repeat Statement
hi! link Statement BOLD
hi! link Define PreProc
hi! link Include PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc
hi! link StorageClass Type
hi! link Structure Type
hi! link Type BOLD
hi! link Typedef Type
hi! link Delimiter Special
hi! link Debug Special
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link Tag Special
hi! link Function Identifier
hi! link lCursor Cursor
hi! link CursorIM Cursor
hi debugBreakpoint guifg=#14afff guibg=#404040 gui=NONE cterm=NONE
hi debugPC guifg=#ff6414 guibg=#000000 gui=NONE cterm=NONE
hi DiffAdd guifg=#add8e6 guibg=#000000 gui=NONE cterm=NONE
hi DiffChange guifg=#ffff00 guibg=#000000 gui=NONE cterm=NONE
hi DiffDelete guifg=#ff0000 guibg=#000000 gui=NONE cterm=NONE
hi DiffText guifg=#da14ff guibg=#000000 gui=NONE cterm=NONE
hi SpellBad guifg=#ff6414 guibg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#d0d0d0 guibg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#add8e6 guibg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#9932cc guibg=NONE gui=NONE cterm=NONE

if s:t_Co >= 256
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
  hi! link ColorColumn REVERSED
  hi! link Conceal REVERSED
  hi! link Cursor REVERSED
  hi! link CursorColumn REVERSED
  hi! link CursorLine REVERSED
  hi! link CursorLineNr REVERSED
  hi! link CurSearch REVERSED
  hi! link IncSearch REVERSED
  hi! link MatchParen REVERSED
  hi! link QuickFixLine REVERSED
  hi! link Search REVERSED
  hi! link StatusLine REVERSED
  hi! link StatusLineNC REVERSED
  hi! link StatusLineTerm REVERSED
  hi! link StatusLineTermNC REVERSED
  hi! link Visual REVERSED
  hi! link VisualNOS REVERSED
  hi! link Folded FOLD
  hi! link CursorLineFold Folded
  hi! link CursorLineSign Folded
  hi! link FoldColumn Folded
  hi! link MessageWindow WARN
  hi! link PopupNotification WARN
  hi! link Todo WARN
  hi! link WarningMsg WARN
  hi! link Error WARN
  hi! link ErrorMsg WARN
  hi! link Question WARN
  hi! link WildMenu MENU
  hi! link PmenuExtra MENU
  hi! link PmenuKind MENU
  hi! link PmenuExtraSel SELECTION
  hi! link PmenuKindSel SELECTION
  hi! link PmenuSel SELECTION
  hi! link PopupSelected SELECTION
  hi! link PmenuSbar MENU
  hi! link PmenuThumb MENU
  hi! link LineNr LINES
  hi! link LineNrAbove LineNr
  hi! link LineNrBelow LineNr
  hi! link NonText PURPLE
  hi! link EndOfBuffer NonText
  hi! link Ignore NonText
  hi! link SignColumn Normal
  hi! link TabLine Normal
  hi! link TabLineFill Normal
  hi! link VertSplit Normal
  hi! link ToolbarButton BOLD
  hi! link ToolbarLine Normal
  hi! link Directory Identifier
  hi! link SpecialKey Special
  hi! link ModeMsg MENU
  hi! link MoreMsg MENU
  hi! link TabLineSel SELECTION
  hi! link Title Normal
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Float Constant
  hi! link Number Constant
  hi! link String Constant
  hi! link Conditional Statement
  hi! link Exception Statement
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Operator Statement
  hi! link Repeat Statement
  hi! link Statement BOLD
  hi! link Define PreProc
  hi! link Include PreProc
  hi! link Macro PreProc
  hi! link PreCondit PreProc
  hi! link StorageClass Type
  hi! link Structure Type
  hi! link Type BOLD
  hi! link Typedef Type
  hi! link Delimiter Special
  hi! link Debug Special
  hi! link SpecialChar Special
  hi! link SpecialComment Special
  hi! link Tag Special
  hi! link Function Identifier
  hi! link lCursor Cursor
  hi! link CursorIM Cursor
  hi debugBreakpoint ctermfg=39 ctermbg=238 cterm=NONE
  hi debugPC ctermfg=202 ctermbg=16 cterm=NONE
  hi DiffAdd ctermfg=152 ctermbg=16 cterm=NONE
  hi DiffChange ctermfg=226 ctermbg=16 cterm=NONE
  hi DiffDelete ctermfg=196 ctermbg=16 cterm=NONE
  hi DiffText ctermfg=165 ctermbg=16 cterm=NONE
  hi SpellBad ctermfg=202 ctermbg=NONE cterm=NONE
  hi SpellCap ctermfg=252 ctermbg=NONE cterm=NONE
  hi SpellLocal ctermfg=152 ctermbg=NONE cterm=NONE
  hi SpellRare ctermfg=128 ctermbg=NONE cterm=NONE
  if !s:italics
    hi Comment cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

