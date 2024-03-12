Vim�UnDo� E�K]z�b>>�M�e��������Z&!t��   �                                   e�9�     _�                             ����                                                                                                                                                                                                                                                                                                                                                             e�9�     �               �   &" Name:         My Minimal Colorscheme   " Author:       Ryan D. Najac   " Maintainer:   Ryan D. Najac   1" License:      Vim License (see `:help license`)   (" Last Updated: Wed Dec 20 13:55:22 2023       #" Generated by Colortemplate v2.2.3       set background=dark       hi clear   let g:colors_name = 'myminimal'       3let s:t_Co = has('gui_running') ? -1 : (&t_Co ?? 0)   Flet s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running')       Aif (has('termguicolors') && &termguicolors) || has('gui_running')   �  let g:terminal_ansi_colors = ['#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000']   endif   9hi Normal guifg=#39ff14 guibg=#000000 gui=NONE cterm=NONE   9hi Comment guifg=#52ff31 guibg=NONE gui=NONE cterm=italic   =hi Underlined guifg=#39ff14 guibg=#000000 gui=NONE cterm=NONE   ;hi Constant guifg=#6514ff guibg=#000000 gui=NONE cterm=NONE   4hi BOLD guifg=#39ff14 guibg=NONE gui=NONE cterm=bold   5hi LINES guifg=#6514ff guibg=NONE gui=NONE cterm=NONE   7hi WARN guifg=#880808 guibg=#ffd700 gui=NONE cterm=NONE   >hi REVERSED guifg=NONE guibg=#000000 gui=reverse cterm=reverse   7hi MENU guifg=#39ff14 guibg=#343434 gui=NONE cterm=NONE   <hi SELECTION guifg=#39ff14 guibg=#6514ff gui=NONE cterm=NONE   9hi PURPLE guifg=#6514ff guibg=#000000 gui=NONE cterm=NONE   4hi BLUE guifg=#14afff guibg=NONE gui=NONE cterm=NONE   9hi FUSCIA guifg=#ff69ff guibg=#000000 gui=NONE cterm=NONE   7hi FOLD guifg=#39ff14 guibg=#16161d gui=NONE cterm=NONE   7hi NONE guifg=#000000 guibg=#000000 gui=NONE cterm=NONE   hi! link ColorColumn REVERSED   hi! link Conceal REVERSED   hi! link Cursor REVERSED   hi! link CursorColumn REVERSED   hi! link CursorLine REVERSED   hi! link CursorLineNr REVERSED   hi! link IncSearch REVERSED   hi! link MatchParen REVERSED   hi! link QuickFixLine REVERSED   hi! link Search REVERSED   hi! link StatusLine REVERSED   hi! link StatusLineNC REVERSED    hi! link StatusLineTerm REVERSED   "hi! link StatusLineTermNC REVERSED   hi! link Visual REVERSED   hi! link VisualNOS REVERSED   hi! link Folded FOLD   hi! link CursorLineFold Folded   hi! link CursorLineSign Folded   hi! link FoldColumn Folded   hi! link MessageWindow WARN   hi! link PopupNotification WARN   hi! link Todo WARN   hi! link WarningMsg WARN   hi! link Error WARN   hi! link ErrorMsg WARN   hi! link Question WARN   hi! link WildMenu MENU   hi! link PmenuExtra MENU   hi! link PmenuKind MENU    hi! link PmenuExtraSel SELECTION   hi! link PmenuKindSel SELECTION    hi! link PopupSelected SELECTION   hi! link LineNr PURPLE   hi! link NonText PURPLE   hi! link EndOfBuffer NonText   hi! link Ignore NonText   hi! link SignColumn Normal   hi! link TabLine Normal   hi! link TabLineFill Normal   hi! link VertSplit Normal   hi! link ToolbarButton BOLD   hi! link ToolbarLine Normal   hi! link Directory BLUE   hi! link SpecialKey FUSCIA   hi! link ModeMsg MENU   hi! link MoreMsg MENU   hi! link TabLineSel SELECTION   hi! link Title Normal   hi! link Boolean Constant   hi! link Character Constant   hi! link Float Constant   hi! link Number Constant   hi! link String Constant   hi! link Conditional Statement   hi! link Exception Statement   hi! link Keyword Statement   hi! link Label Statement   hi! link Operator Statement   hi! link Repeat Statement   hi! link Statement BOLD   hi! link Define PreProc   hi! link Include PreProc   hi! link Macro PreProc   hi! link PreCondit PreProc   hi! link PreProc FUSCIA   hi! link StorageClass Type   hi! link Structure Type   hi! link Type BOLD   hi! link Typedef Type   hi! link Delimiter Special   hi! link Debug Special   hi! link SpecialChar Special   hi! link SpecialComment Special   hi! link Tag Special   hi! link Identifier BLUE   hi! link Function Identifier   hi! link Special FUSCIA   hi! link lCursor Cursor   hi! link CursorIM Cursor       if s:t_Co >= 256   ,  hi Normal ctermfg=46 ctermbg=16 cterm=NONE   1  hi Comment ctermfg=46 ctermbg=NONE cterm=italic   0  hi Underlined ctermfg=46 ctermbg=16 cterm=NONE   .  hi Constant ctermfg=57 ctermbg=16 cterm=NONE   ,  hi BOLD ctermfg=46 ctermbg=NONE cterm=bold   -  hi LINES ctermfg=57 ctermbg=NONE cterm=NONE   +  hi WARN ctermfg=88 ctermbg=220 cterm=NONE   3  hi REVERSED ctermfg=NONE ctermbg=16 cterm=reverse   +  hi MENU ctermfg=46 ctermbg=236 cterm=NONE   /  hi SELECTION ctermfg=46 ctermbg=57 cterm=NONE   ,  hi PURPLE ctermfg=57 ctermbg=16 cterm=NONE   ,  hi BLUE ctermfg=39 ctermbg=NONE cterm=NONE   -  hi FUSCIA ctermfg=207 ctermbg=16 cterm=NONE   +  hi FOLD ctermfg=46 ctermbg=233 cterm=NONE   *  hi NONE ctermfg=16 ctermbg=16 cterm=NONE     hi! link ColorColumn REVERSED     hi! link Conceal REVERSED     hi! link Cursor REVERSED      hi! link CursorColumn REVERSED     hi! link CursorLine REVERSED      hi! link CursorLineNr REVERSED     hi! link IncSearch REVERSED     hi! link MatchParen REVERSED      hi! link QuickFixLine REVERSED     hi! link Search REVERSED     hi! link StatusLine REVERSED      hi! link StatusLineNC REVERSED   "  hi! link StatusLineTerm REVERSED   $  hi! link StatusLineTermNC REVERSED     hi! link Visual REVERSED     hi! link VisualNOS REVERSED     hi! link Folded FOLD      hi! link CursorLineFold Folded      hi! link CursorLineSign Folded     hi! link FoldColumn Folded     hi! link MessageWindow WARN   !  hi! link PopupNotification WARN     hi! link Todo WARN     hi! link WarningMsg WARN     hi! link Error WARN     hi! link ErrorMsg WARN     hi! link Question WARN     hi! link WildMenu MENU     hi! link PmenuExtra MENU     hi! link PmenuKind MENU   "  hi! link PmenuExtraSel SELECTION   !  hi! link PmenuKindSel SELECTION   "  hi! link PopupSelected SELECTION     hi! link LineNr PURPLE     hi! link NonText PURPLE     hi! link EndOfBuffer NonText     hi! link Ignore NonText     hi! link SignColumn Normal     hi! link TabLine Normal     hi! link TabLineFill Normal     hi! link VertSplit Normal     hi! link ToolbarButton BOLD     hi! link ToolbarLine Normal     hi! link Directory BLUE     hi! link SpecialKey FUSCIA     hi! link ModeMsg MENU     hi! link MoreMsg MENU     hi! link TabLineSel SELECTION     hi! link Title Normal     hi! link Boolean Constant     hi! link Character Constant     hi! link Float Constant     hi! link Number Constant     hi! link String Constant      hi! link Conditional Statement     hi! link Exception Statement     hi! link Keyword Statement     hi! link Label Statement     hi! link Operator Statement     hi! link Repeat Statement     hi! link Statement BOLD     hi! link Define PreProc     hi! link Include PreProc     hi! link Macro PreProc     hi! link PreCondit PreProc     hi! link PreProc FUSCIA     hi! link StorageClass Type     hi! link Structure Type     hi! link Type BOLD     hi! link Typedef Type     hi! link Delimiter Special     hi! link Debug Special     hi! link SpecialChar Special   !  hi! link SpecialComment Special     hi! link Tag Special     hi! link Identifier BLUE     hi! link Function Identifier     hi! link Special FUSCIA     hi! link lCursor Cursor     hi! link CursorIM Cursor     if !s:italics       hi Comment cterm=NONE     endif     unlet s:t_Co s:italics     finish   endif       " Background: dark   " Color: black       #000000 ~   " Color: eigengrau    #16161d ~   " Color: neongreen   #39ff14 ~   " Color: mypurple    #6514FF ~   " Color: myblue      #14AFFF ~   " Color: fuscia      #ff69ff ~   " Color: jetblack    #343434 ~   " Color: bloodred    #880808 ~   " Color: gold        #FFD700 ~   " Color: palegreen   #52FF31 ~   &" Term colors: black black black black   &" Term colors: black black black black   &" Term colors: black black black black   &" Term colors: black black black black   " vim: et ts=8 sw=2 sts=25�_�                             ����                                                                                                                                                                                                                                                                                                                                                             e�9�     �               �   &" Name:         My Minimal Colorscheme   " Author:       Ryan D. Najac   " Maintainer:   Ryan D. Najac   1" License:      Vim License (see `:help license`)   (" Last Updated: Wed Dec 20 13:59:38 2023       #" Generated by Colortemplate v2.2.3       set background=dark       hi clear   let g:colors_name = 'myminimal'       3let s:t_Co = has('gui_running') ? -1 : (&t_Co ?? 0)   Flet s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running')       Aif (has('termguicolors') && &termguicolors) || has('gui_running')   �  let g:terminal_ansi_colors = ['#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000', '#000000']   endif   9hi Normal guifg=#39ff14 guibg=#000000 gui=NONE cterm=NONE   9hi Comment guifg=#52ff31 guibg=NONE gui=NONE cterm=italic   =hi Underlined guifg=#39ff14 guibg=#000000 gui=NONE cterm=NONE   ;hi Constant guifg=#6514ff guibg=#000000 gui=NONE cterm=NONE   4hi BOLD guifg=#39ff14 guibg=NONE gui=NONE cterm=bold   5hi LINES guifg=#6514ff guibg=NONE gui=NONE cterm=NONE   7hi WARN guifg=#880808 guibg=#ffd700 gui=NONE cterm=NONE   >hi REVERSED guifg=NONE guibg=#000000 gui=reverse cterm=reverse   7hi MENU guifg=#39ff14 guibg=#343434 gui=NONE cterm=NONE   <hi SELECTION guifg=#39ff14 guibg=#6514ff gui=NONE cterm=NONE   9hi PURPLE guifg=#6514ff guibg=#000000 gui=NONE cterm=NONE   4hi BLUE guifg=#14afff guibg=NONE gui=NONE cterm=NONE   9hi FUSCIA guifg=#ff69ff guibg=#000000 gui=NONE cterm=NONE   7hi FOLD guifg=#39ff14 guibg=#16161d gui=NONE cterm=NONE   7hi NONE guifg=#000000 guibg=#000000 gui=NONE cterm=NONE   hi! link ColorColumn REVERSED   hi! link Conceal REVERSED   hi! link Cursor REVERSED   hi! link CursorColumn REVERSED   hi! link CursorLine REVERSED   hi! link CursorLineNr REVERSED   hi! link CurSearch REVERSED   hi! link IncSearch REVERSED   hi! link MatchParen REVERSED   hi! link QuickFixLine REVERSED   hi! link Search REVERSED   hi! link StatusLine REVERSED   hi! link StatusLineNC REVERSED    hi! link StatusLineTerm REVERSED   "hi! link StatusLineTermNC REVERSED   hi! link Visual REVERSED   hi! link VisualNOS REVERSED   hi! link Folded FOLD   hi! link CursorLineFold Folded   hi! link CursorLineSign Folded   hi! link FoldColumn Folded   hi! link MessageWindow WARN   hi! link PopupNotification WARN   hi! link Todo WARN   hi! link WarningMsg WARN   hi! link Error WARN   hi! link ErrorMsg WARN   hi! link Question WARN   hi! link WildMenu MENU   hi! link PmenuExtra MENU   hi! link PmenuKind MENU    hi! link PmenuExtraSel SELECTION   hi! link PmenuKindSel SELECTION   hi! link PmenuSel SELECTION    hi! link PopupSelected SELECTION   hi! link PMenuSbar MENU   hi! link PMenuThumb MENU   hi! link LineNr PURPLE   hi! link LineNrAbove LineNr   hi! link LineNrBelow LineNr   hi! link NonText PURPLE   hi! link EndOfBuffer NonText   hi! link Ignore NonText   hi! link SignColumn Normal   hi! link TabLine Normal   hi! link TabLineFill Normal   hi! link VertSplit Normal   hi! link ToolbarButton BOLD   hi! link ToolbarLine Normal   hi! link Directory BLUE   hi! link SpecialKey FUSCIA   hi! link ModeMsg MENU   hi! link MoreMsg MENU   hi! link TabLineSel SELECTION   hi! link Title Normal   hi! link Boolean Constant   hi! link Character Constant   hi! link Float Constant   hi! link Number Constant   hi! link String Constant   hi! link Conditional Statement   hi! link Exception Statement   hi! link Keyword Statement   hi! link Label Statement   hi! link Operator Statement   hi! link Repeat Statement   hi! link Statement BOLD   hi! link Define PreProc   hi! link Include PreProc   hi! link Macro PreProc   hi! link PreCondit PreProc   hi! link PreProc FUSCIA   hi! link StorageClass Type   hi! link Structure Type   hi! link Type BOLD   hi! link Typedef Type   hi! link Delimiter Special   hi! link Debug Special   hi! link SpecialChar Special   hi! link SpecialComment Special   hi! link Tag Special   hi! link Identifier BLUE   hi! link Function Identifier   hi! link Special FUSCIA   hi! link lCursor Cursor   hi! link CursorIM Cursor       if s:t_Co >= 256   ,  hi Normal ctermfg=46 ctermbg=16 cterm=NONE   1  hi Comment ctermfg=46 ctermbg=NONE cterm=italic   0  hi Underlined ctermfg=46 ctermbg=16 cterm=NONE   .  hi Constant ctermfg=57 ctermbg=16 cterm=NONE   ,  hi BOLD ctermfg=46 ctermbg=NONE cterm=bold   -  hi LINES ctermfg=57 ctermbg=NONE cterm=NONE   +  hi WARN ctermfg=88 ctermbg=220 cterm=NONE   3  hi REVERSED ctermfg=NONE ctermbg=16 cterm=reverse   +  hi MENU ctermfg=46 ctermbg=236 cterm=NONE   /  hi SELECTION ctermfg=46 ctermbg=57 cterm=NONE   ,  hi PURPLE ctermfg=57 ctermbg=16 cterm=NONE   ,  hi BLUE ctermfg=39 ctermbg=NONE cterm=NONE   -  hi FUSCIA ctermfg=207 ctermbg=16 cterm=NONE   +  hi FOLD ctermfg=46 ctermbg=233 cterm=NONE   *  hi NONE ctermfg=16 ctermbg=16 cterm=NONE     hi! link ColorColumn REVERSED     hi! link Conceal REVERSED     hi! link Cursor REVERSED      hi! link CursorColumn REVERSED     hi! link CursorLine REVERSED      hi! link CursorLineNr REVERSED     hi! link CurSearch REVERSED     hi! link IncSearch REVERSED     hi! link MatchParen REVERSED      hi! link QuickFixLine REVERSED     hi! link Search REVERSED     hi! link StatusLine REVERSED      hi! link StatusLineNC REVERSED   "  hi! link StatusLineTerm REVERSED   $  hi! link StatusLineTermNC REVERSED     hi! link Visual REVERSED     hi! link VisualNOS REVERSED     hi! link Folded FOLD      hi! link CursorLineFold Folded      hi! link CursorLineSign Folded     hi! link FoldColumn Folded     hi! link MessageWindow WARN   !  hi! link PopupNotification WARN     hi! link Todo WARN     hi! link WarningMsg WARN     hi! link Error WARN     hi! link ErrorMsg WARN     hi! link Question WARN     hi! link WildMenu MENU     hi! link PmenuExtra MENU     hi! link PmenuKind MENU   "  hi! link PmenuExtraSel SELECTION   !  hi! link PmenuKindSel SELECTION     hi! link PmenuSel SELECTION   "  hi! link PopupSelected SELECTION     hi! link PMenuSbar MENU     hi! link PMenuThumb MENU     hi! link LineNr PURPLE     hi! link LineNrAbove LineNr     hi! link LineNrBelow LineNr     hi! link NonText PURPLE     hi! link EndOfBuffer NonText     hi! link Ignore NonText     hi! link SignColumn Normal     hi! link TabLine Normal     hi! link TabLineFill Normal     hi! link VertSplit Normal     hi! link ToolbarButton BOLD     hi! link ToolbarLine Normal     hi! link Directory BLUE     hi! link SpecialKey FUSCIA     hi! link ModeMsg MENU     hi! link MoreMsg MENU     hi! link TabLineSel SELECTION     hi! link Title Normal     hi! link Boolean Constant     hi! link Character Constant     hi! link Float Constant     hi! link Number Constant     hi! link String Constant      hi! link Conditional Statement     hi! link Exception Statement     hi! link Keyword Statement     hi! link Label Statement     hi! link Operator Statement     hi! link Repeat Statement     hi! link Statement BOLD     hi! link Define PreProc     hi! link Include PreProc     hi! link Macro PreProc     hi! link PreCondit PreProc     hi! link PreProc FUSCIA     hi! link StorageClass Type     hi! link Structure Type     hi! link Type BOLD     hi! link Typedef Type     hi! link Delimiter Special     hi! link Debug Special     hi! link SpecialChar Special   !  hi! link SpecialComment Special     hi! link Tag Special     hi! link Identifier BLUE     hi! link Function Identifier     hi! link Special FUSCIA     hi! link lCursor Cursor     hi! link CursorIM Cursor     if !s:italics       hi Comment cterm=NONE     endif     unlet s:t_Co s:italics     finish   endif       " Background: dark   " Color: black       #000000 ~   " Color: eigengrau    #16161d ~   " Color: neongreen   #39ff14 ~   " Color: mypurple    #6514FF ~   " Color: myblue      #14AFFF ~   " Color: fuscia      #ff69ff ~   " Color: jetblack    #343434 ~   " Color: bloodred    #880808 ~   " Color: gold        #FFD700 ~   " Color: palegreen   #52FF31 ~   &" Term colors: black black black black   &" Term colors: black black black black   &" Term colors: black black black black   &" Term colors: black black black black   " vim: et ts=8 sw=2 sts=25��