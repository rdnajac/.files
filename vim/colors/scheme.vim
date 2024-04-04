" vim:fdm=marker:foldlevel=0
" colorscheme

" initialization {{{1
set background=dark
hi clear
if exists('syntax_on')
	syntax reset
endif
let g:colors_name = "scheme"
" 1}}}

" highlighting function {{{1
function! Hi(group, fgColor, bgColor, style)
  let l:gui_fg = type(a:fgColor) == v:t_list ? a:fgColor[0] : a:fgColor
  let l:cterm_fg = type(a:fgColor) == v:t_list ? a:fgColor[1] : a:fgColor
  let l:gui_bg = type(a:bgColor) == v:t_list ? a:bgColor[0] : a:bgColor
  let l:cterm_bg = type(a:bgColor) == v:t_list ? a:bgColor[1] : a:bgColor
  let l:gui_style = a:style
  let l:cterm_style = a:style

  if !has('gui_running') && exists('g:no_terminal_italic') && g:no_terminal_italic && a:style == 'italic'
    let l:cterm_style = 'NONE'
  endif

  execute printf('hi %s guifg=%s guibg=%s gui=%s ctermfg=%s ctermbg=%s cterm=%s',
        \ a:group, l:gui_fg, l:gui_bg, l:gui_style, l:cterm_fg, l:cterm_bg, l:cterm_style)
endfunction

" 1}}}


" shell colors
let s:bg = '#000000'
let s:fg = '#39ff14'
let s:blue = '#14afff'
let s:magenta = '#ff69ff'

" define color palette
let s:lime   = "#39ff14"
let s:light  = "#d4d4d5"
let s:dark   = "#000000"
let s:gray0  = "#666666"
let s:gray1  = "#323232"
let s:gray2  = "#23242a"
let s:gray3  = "#2b2b2b"
let s:yellow = "#ffe59e"
let s:blue   = "#52de97"
let s:green  = "#79dcaa"
let s:red    = "#f87070"


" Primitives
call s:Hi'String'      , s:lime  , 'NONE' , 'NONE' )
call s:Hi'Number'      , s:light , 'NONE' , 'NONE' )
call s:Hi'Boolean'     , s:light , 'NONE' , 'NONE' )
call s:Hi'Float'       , s:light , 'NONE' , 'NONE' )
call s:Hi'Constant'    , s:light , 'NONE' , 'NONE' )
call s:Hi'Character'   , s:light , 'NONE' , 'NONE' )
call s:Hi'SpecialChar' , s:light , 'NONE' , 'NONE' )

" Specials
call s:Hi'Title'          , s:gray0  , 'NONE' , 'NONE' )
call s:Hi'Todo'           , s:yellow , 'NONE' , 'NONE' )
call s:Hi'Comment'        , s:gray0  , 'NONE' , 'NONE' )
call s:Hi'SpecialComment' , s:gray0  , 'NONE' , 'NONE' )

" Lines                  , Columns
call s:Hi'LineNr'       , s:gray0 , 'NONE'  , 'NONE' )
call s:Hi'CursorLine'   , 'NONE'  , s:gray3 , 'NONE' )
call s:Hi'CursorLineNr' , s:light , s:gray3, 'NONE'  )
call s:Hi'SignColumn'   , s:gray3 , s:dark  , 'NONE' )
call s:Hi'ColorColumn'  , s:light , s:gray3 , 'NONE' )
call s:Hi'CursorColumn' , s:light , s:gray3 , 'NONE' )

" Visual
call s:Hi'Visual'    , 'NONE'   , s:gray1 , 'NONE' )
call s:Hi'VisualNOS' , s:gray3  , s:light , 'NONE' )
call s:Hi'Search'    , s:yellow , s:gray0 , 'NONE' )
call s:Hi'IncSearch' , s:yellow , s:gray0 , 'NONE' )

" Spelling
call s:Hi'SpellBad'   , s:red , s:dark , 'NONE' )
call s:Hi'SpellCap'   , s:red , s:dark , 'NONE' )
call s:Hi'SpellLocal' , s:red , s:dark , 'NONE' )
call s:Hi'SpellRare'  , s:red , s:dark , 'NONE' )

" Messages
call s:Hi'ErrorMsg'   , s:red    , s:dark , 'NONE' )
call s:Hi'WarningMsg' , s:yellow , s:dark , 'NONE' )
call s:Hi'ModeMsg'    , s:light  , s:dark , 'NONE' )
call s:Hi'MoreMsg'    , s:light  , s:dark , 'NONE' )
call s:Hi'Error'      , s:red    , s:dark , 'NONE' )

" Preprocessor Directives
call s:Hi'Include'		  , s:light	, 'NONE', 'NONE' )
call s:Hi'Define'		  , s:light	, 'NONE', 'NONE' )
call s:Hi'Macro'		  , s:light	, 'NONE', 'NONE' )
call s:Hi'PreCondit'	  , s:light	, 'NONE', 'NONE' )
call s:Hi'PreProc'		  , s:light	, 'NONE', 'NONE' )

" Bindings
call s:Hi'Identifier'	  , s:light	, 'NONE', 'NONE' )
call s:Hi'Function'	  , s:light	, 'NONE', 'NONE' )
call s:Hi'Keyword'		  , s:light	, 'NONE', 'NONE' )
call s:Hi'Operator'	  , s:light	, 'NONE', 'NONE' )

" Types
call s:Hi'Type'		  , s:light	, 'NONE', 'NONE' )
call s:Hi'Typedef'	  	  , s:light	, 'NONE', 'NONE' )
call s:Hi'StorageClass'  , s:light	, 'NONE', 'NONE' )
call s:Hi'Structure'	  , s:light	, 'NONE', 'NONE' )

" Flow Control
call s:Hi'Statement'	  , s:light	, 'NONE', 'NONE' )
call s:Hi'Conditional'	  , s:light	, 'NONE', 'NONE' )
call s:Hi'Repeat'		  , s:light	, 'NONE', 'NONE' )
call s:Hi'Label'		  , s:light	, 'NONE', 'NONE' )
call s:Hi'Exception'	  , s:light	, 'NONE', 'NONE' )

" Misc
call s:Hi'Normal'     , s:light , s:dark  , 'NONE'      )
call s:Hi'Cursor'     , s:dark  , s:light , 'NONE'      )
call s:Hi'Underlined' , s:light , 'NONE'  , 'underline' )
call s:Hi'SpecialKey' , s:light , 'NONE'  , 'NONE'      )
call s:Hi'NonText'    , s:light , 'NONE'  , 'NONE'      )
call s:Hi'Directory'  , s:light , 'NONE'  , 'NONE'      )

" Fold
call s:Hi'FoldColumn'	  , s:light, s:gray3 , 'NONE' )
call s:Hi'Folded'		  , s:light, s:gray3 , 'NONE' )

" Parens
call s:Hi'MatchParen'	  , s:dark, s:light , 'NONE' )

" Popup Menu
call s:Hi'Pmenu'      , s:light , s:gray1 , 'NONE' )
call s:Hi'PmenuSbar'  , s:dark  , s:gray3 , 'NONE' )
call s:Hi'PmenuSel'   , s:dark  , s:light , 'NONE' )
call s:Hi'PmenuThumb' , s:dark  , s:light , 'NONE' )

" Split
call s:Hi'VertSplit'	  , s:gray1, s:dark , 'bold' )

" Others
call s:Hi'Debug'        , s:light , 'NONE'  , 'NONE' )
call s:Hi'Delimiter'    , s:light , 'NONE'  , 'NONE' )
call s:Hi'Question'     , s:light , 'NONE'  , 'NONE' )
call s:Hi'Special'      , s:light , 'NONE'  , 'NONE' )
call s:Hi'StatusLine'   , s:light , s:gray2 , 'NONE' )
call s:Hi'StatusLineNC' , s:light , s:gray2 , 'NONE' )
call s:Hi'Tag'          , s:light , 'NONE'  , 'NONE' )
call s:Hi'WildMenu'     , s:dark  , s:light , 'NONE' )
call s:Hi'TabLine'      , s:light , s:gray2 , 'NONE' )

" Diff
call s:Hi'DiffAdd'    , s:green  , 'NONE' , 'NONE' )
call s:Hi'DiffChange' , s:yellow , 'NONE' , 'NONE' )
call s:Hi'DiffDelete' , s:red    , 'NONE' , 'NONE' )
call s:Hi'DiffText'   , s:dark   , 'NONE' , 'NONE' )

" GitGutter
call s:Hi'GitGutterAdd'          , s:green  , 'NONE' , 'NONE' )
call s:Hi'GitGutterChange'       , s:yellow , 'NONE' , 'NONE' )
call s:Hi'GitGutterDelete'       , s:red    , 'NONE' , 'NONE' )
call s:Hi'GitGutterChangeDelete' , s:dark   , 'NONE' , 'NONE' )

" Vimscript
call s:Hi'vimFunc'          , s:light , 'NONE' , 'NONE' )
call s:Hi'vimUserFunc'      , s:light , 'NONE' , 'NONE' )
call s:Hi'vimLineComment'   , s:gray0 , 'NONE' , 'NONE' )
call s:Hi'vimCommentString' , s:gray0 , 'NONE' , 'NONE' )


"exec 'hi! link ColorColumn REVERSED'
"exec 'hi! link Conceal REVERSED'
"exec 'hi! link Cursor REVERSED'
"exec 'hi! link CursorColumn REVERSED'
"exec 'hi! link CursorLine REVERSED'
"exec 'hi! link CursorLineNr REVERSED'
"exec 'hi! link CurSearch REVERSED'
"exec 'hi! link IncSearch REVERSED'
"exec 'hi! link MatchParen REVERSED'
"exec 'hi! link QuickFixLine REVERSED'
"exec 'hi! link Search REVERSED'
"exec 'hi! link StatusLine REVERSED'
"exec 'hi! link StatusLineNC REVERSED'
"exec 'hi! link StatusLineTerm REVERSED'
"exec 'hi! link StatusLineTermNC REVERSED'
"exec 'hi! link Visual REVERSED'
"exec 'hi! link VisualNOS REVERSED'

