function! myowish#SetConfig() abort
    if !exists('g:myowish')
        let g:myowish = {}
    endif
    let g:myowish = {
                \ 'term_italic'     : !has_key(g:myowish, 'term_italic')     ? 0      : g:myowish.term_italic,
                \ 'comment_italic'  : !has_key(g:myowish, 'comment_italic')  ? 0      : g:myowish.comment_italic,
                \ 'spell_bad_color' : !has_key(g:myowish, 'spell_bad_color') ? 'NONE' : g:myowish.spell_bad_color,
                \ 'colors'          : !has_key(g:myowish, 'colors')          ? {}     : g:myowish.colors
                \ }
    let g:myowish.colors = extend({
                \ 'background'       : ['#000000','235'],
                \ 'backgroundDark'   : ['#000000','232'],
                \ 'backgroundLight'  : ['#393939','236'],
                \ 'comment'          : ['#6e6e6e','242'],
                \ 'green'            : ['#2acf2a','40'],
                \ 'magenta'          : ['#ff69ff','67'],
                \ 'lightBlue'        : ['#14afff','117'],
                \ 'lightGreen'       : ['#39ff14','108'],
                \ 'lightRed'         : ['#f2777a','203'],
                \ 'lightViolet'      : ['#d09cea','171'],
                \ 'lightYellow'      : ['#ffcc66','222'],
                \ 'red'              : ['#f01d22','160'],
                \ 'selected'         : ['#373b41','234'],
                \ 'text'             : ['#39ff14','none'],
                \ 'textDark'         : ['#bebebe','249'],
                \ 'textExtraDark'    : ['#8c8c8c','244'],
                \ 'textLight'        : ['#ebebeb','255'],
                \ 'yellow'           : ['#ffbe3c','215'],
                \ }, g:myowish.colors, 'force')
    let g:myowish.colors.columnBackground = g:myowish.colors.background
    let g:myowish.colors.columnElements = g:myowish.colors.comment
endfunction

function! myowish#GetColorFor(name) abort " {{{1
    if has_key(g:myowish.colors, a:name)
        return g:myowish.colors[a:name]
    endif

    return 'NONE'
endfunction
" 1}}}

" myowish colorscheme.

" Version      : 0.7.3
" Creation     : 2015-01-09
" Modification : 2017-12-10
" Maintainer   : Kabbaj Amine <amine.kabb@gmail.com>
" License      : This file is placed in the public domain.

" Initialization {{{1
set background=dark
hi clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name = 'myowish'
" 1}}}

" Get config & colors [hex, term256] {{{1
call myowish#SetConfig()
let s:color = g:myowish.colors
" 1}}}

" Highlighting function {{{1
fun! s:Hi(groupName, bgColor, fgColor, opt)
    let l:bg = type(a:bgColor) ==# type('') ? ['NONE', 'NONE' ] : a:bgColor
    let l:fg = type(a:fgColor) ==# type('') ? ['NONE', 'NONE'] : a:fgColor
    let l:opt = !g:myowish.term_italic && a:opt ==# 'italic' ?
                \ [a:opt, 'NONE'] : [a:opt, a:opt]
    let l:mode = ['gui', 'cterm']
    let l:cmd = 'hi ' . a:groupName
    for l:i in (range(0, len(l:mode)-1))
        let l:cmd .= printf(' %sbg=%s %sfg=%s %s=%s',
                    \ l:mode[l:i], l:bg[l:i],
                    \ l:mode[l:i], l:fg[l:i],
                    \ l:mode[l:i], l:opt[l:i]
                    \ )
    endfor
    execute l:cmd
endfun
" 1}}}

" *********************
" Highlighting
" *********************

" Normal syntax groups {{{1
call s:Hi('Constant'  , 'NONE' , s:color.lightRed    , 'NONE')
call s:Hi('PreProc'   , 'NONE' , s:color.lightViolet , 'NONE')
call s:Hi('Statement' , 'NONE' , s:color.lightYellow , 'NONE')
call s:Hi('String'    , 'NONE' , s:color.lightGreen  , 'NONE')
call s:Hi('Identifier'   , 'NONE'                   , s:color.magenta       , 'NONE')
hi! link Character String
" Default {{{1
call s:Hi('ColorColumn'  , s:color.backgroundDark   , s:color.yellow          , 'bold')
if g:myowish.comment_italic
    call s:Hi('Comment'  , 'NONE'                   , s:color.comment         , 'italic')
else
    call s:Hi('Comment'  , 'NONE'                   , s:color.comment         , 'NONE')
endif
call s:Hi('Conceal'      , 'NONE'                   , s:color.backgroundLight , 'NONE')
call s:Hi('CursorLineNr' , 'NONE'                   , s:color.lightYellow     , 'NONE')
call s:Hi('CursorLine'   , s:color.backgroundLight  , 'NONE'                  , 'NONE')
call s:Hi('Cursor'       , s:color.text             , s:color.backgroundDark  , 'NONE')
call s:Hi('ErrorMsg'     , s:color.red              , s:color.text            , 'bold')
call s:Hi('Normal'       , s:color.background       , s:color.text            , 'NONE')
call s:Hi('PmenuSel'     , s:color.background       , s:color.text            , 'NONE')
call s:Hi('DiffChange'   , s:color.backgroundLight  , s:color.lightYellow     , 'NONE')
call s:Hi('DiffDelete'   , s:color.lightRed         , s:color.backgroundDark  , 'NONE')
call s:Hi('DiffAdd'      , s:color.lightGreen       , s:color.backgroundDark  , 'NONE')
call s:Hi('DiffText'     , 'NONE'                   , s:color.textDark        , 'NONE')
call s:Hi('Directory'    , 'NONE'                   , s:color.textDark        , 'NONE')
call s:Hi('Error'        , 'NONE'                   , s:color.red             , 'bold')
call s:Hi('FoldColumn'   , s:color.columnBackground , s:color.columnElements  , 'NONE')
call s:Hi('IncSearch'    , s:color.lightYellow      , s:color.background      , 'NONE')
call s:Hi('LineNr'       , 'NONE'                   , s:color.backgroundLight , 'NONE')
call s:Hi('MatchParen'   , 'NONE'                   , s:color.yellow          , 'bold')
call s:Hi('ModeMsg'      , 'NONE'                   , s:color.yellow          , 'bold')
call s:Hi('PmenuSbar'    , s:color.selected         , s:color.lightYellow     , 'NONE')
call s:Hi('Pmenu'        , s:color.backgroundLight  , s:color.textDark        , 'NONE')
call s:Hi('Question'     , 'NONE'                   , s:color.lightGreen      , 'bold')
call s:Hi('Search'       , s:color.yellow           , s:color.backgroundDark  , 'bold')
call s:Hi('SpecialKey'   , 'NONE'                   , s:color.backgroundLight , 'NONE')
call s:Hi('Special'      , 'NONE'                   , s:color.textLight       , 'NONE')

let s:spell_bad_color = myowish#GetColorFor(g:myowish.spell_bad_color)
call s:Hi('SpellBad'     , 'NONE'                   , s:spell_bad_color       , 'undercurl')

call s:Hi('StatusLineNC' , s:color.backgroundLight  , s:color.text            , 'NONE')
call s:Hi('StatusLine'   , s:color.yellow           , s:color.background      , 'NONE')
call s:Hi('TabLineFill'  , 'NONE'                   , s:color.text            , 'NONE')
call s:Hi('TabLine'      , s:color.backgroundLight  , s:color.textDark        , 'NONE')
call s:Hi('TabLineSel'   , s:color.background       , s:color.yellow          , 'bold')
call s:Hi('Title'        , 'NONE'                   , s:color.lightRed        , 'NONE')
call s:Hi('Todo'         , 'NONE'                   , s:color.yellow          , 'NONE')
call s:Hi('Type'         , 'NONE'                   , s:color.textDark        , 'NONE')
call s:Hi('VertSplit'    , 'NONE'                   , s:color.yellow          , 'NONE')
call s:Hi('Visual'       , s:color.selected         , 'NONE'                  , 'NONE')
call s:Hi('WarningMsg'   , 'NONE'                   , s:color.yellow          , 'bold')
call s:Hi('WildMenu'     , s:color.background       , s:color.yellow          , 'NONE')
hi! link CursorColumn CursorLine
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete
hi! link Folded FoldColumn
hi! link NonText Conceal
hi! link qfFileName Comment
hi! link qfLineNr Statement
hi! link qfSeparator qfLineNr
hi! link SignColumn FoldColumn
hi! link VisualNOS Visual
if has('terminal')
    call s:Hi('Terminal', s:color.backgroundDark, s:color.textDark, 'NONE')
endif
" Vim {{{1
call s:Hi('vimAutoEvent' , 'NONE' , s:color.textExtraDark , 'NONE')
call s:Hi('vimCommand'   , 'NONE' , s:color.lightRed      , 'NONE')
call s:Hi('vimContinue'  , 'NONE' , s:color.textDark      , 'NONE')
call s:Hi('vimFuncName'  , 'NONE' , s:color.lightYellow   , 'NONE')
call s:Hi('vimOper'      , 'NONE' , s:color.text          , 'NONE')
hi! link vimCommentString Comment
hi! link vimCommentTitle Comment
hi! link vimEchoHLNone vimOper
hi! link vimFunc vimFuncName
hi! link vimGroup vimFuncName
hi! link vimHiGroup vimFuncName
hi! link vimIsCommand vimCommand
hi! link vimMapModKey vimOper
hi! link vimMapMod vimOper
hi! link vimSep vimOper
hi! link vimUserCmd vimCommand
hi! link vimNotation vimOper
hi! link vimOperParen vimOper
hi! link vimParenSep vimOper
hi! link vimSynType vimFuncName
" Vimhelp {{{1
call s:Hi('helpExample'        , 'NONE' , s:color.textExtraDark , 'NONE')
call s:Hi('helpHyperTextEntry' , 'NONE' , s:color.lightRed      , 'bold')
call s:Hi('helpHyperTextJump'  , 'NONE' , s:color.lightYellow   , 'NONE')
hi! link helpOption helpExample
hi! link helpSectionDelim helpExample
" " HTML {{{1
" call s:Hi('HtmlArg'         , 'NONE' , s:color.lightYellow , 'NONE')
" call s:Hi('HtmlH1'          , 'NONE' , s:color.text        , 'NONE')
" call s:Hi('HtmlLink'        , 'NONE' , s:color.text        , 'underline')
" call s:Hi('HtmlSpecialChar' , 'NONE' , s:color.textDark    , 'NONE')
" call s:Hi('HtmlTagName'     , 'NONE' , s:color.lightRed    , 'NONE')
" call s:Hi('HtmlTitle'       , 'NONE' , s:color.text        , 'bold')
" call s:Hi('HtmlUnderline'   , 'NONE' , 'NONE'              , 'underline')
" " For https://github.com/othree/html5.vim
" hi! link HtmlScriptTag HtmlTagName
" hi! link HtmlSpecialTagName HtmlTagName
" " Markdown {{{1
" call s:Hi('markdownBlockquote'  , 'NONE' , s:color.magenta     , 'NONE')
" call s:Hi('markdownCodeBlock'   , 'NONE' , s:color.textExtraDark , 'NONE')
" call s:Hi('markdownCode'        , 'NONE' , s:color.lightGreen    , 'NONE')
" call s:Hi('markdownH1'          , 'NONE' , s:color.textLight     , 'bold')
" call s:Hi('markdownHeadingRule' , 'NONE' , s:color.lightViolet   , 'bold')
" call s:Hi('markdownItalic'      , 'NONE' , 'NONE'                , 'italic')
" call s:Hi('markdownLinkText'    , 'NONE' , s:color.magenta     , 'underline')
" call s:Hi('markdownListMarker'  , 'NONE' , s:color.lightRed      , 'NONE')
" call s:Hi('markdownUrl'         , 'NONE' , s:color.lightYellow   , 'NONE')
" hi! link markdownCodeDelimiter markdownCode
" hi! link markdownH2 markdownH1
" hi! link markdownH3 markdownH1
" hi! link markdownH4 markdownH1
" hi! link markdownH5 markdownH1
" hi! link markdownH6 markdownH1
" hi! link markdownHeadingDelimiter markdownHeadingRule
" hi! link markdownIdDeclaration markdownLinkText
" hi! link markdownRule markdownCodeBlock
" hi! link markdownURLTitleDelimiter markdownUrl
" " For https://github.com/gabrielelana/vim-markdown
" call s:Hi('markdownLinkReference', 'NONE', s:color.textDark, 'NONE')
" hi! link markdownBlockquoteDelimiter markdownBlockquote
" hi! link markdownEmoticonKeyword markdownH1
" hi! link markdownInlineCode markdownCode
" hi! link markdownItemDelimiter markdownListMarker
" hi! link markdownLinkUrl markdownUrl
" hi! link markdownStrike normal
" hi! link markdownXmlElement markdownCode
" }}}
unlet s:color
delfunction s:Hi

" vim:ft=vim:fdm=marker:fmr={{{,}}}:
