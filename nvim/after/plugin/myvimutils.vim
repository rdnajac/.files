command! BreakHere call utils#breakHere()
nnoremap ,l <cmd>BreakHere<CR>

command! ReplaceSelection call utils#replaceSelection()

command! QuickFormat call format#buffer()
nnoremap Q <cmd>QuickFormat<CR>


" time abbreviations
ia <expr> DT strftime('%B %d, %Y')
ia <expr> dt strftime('%Y-%m-%d')
ia <expr> tm strftime('%H:%M:%S')
ia <expr> dtm strftime('%Y-%m-%d %H:%M:%S')
ia LR LAST REVISION: <C-R>=strftime('%Y-%m-%d')<CR>
