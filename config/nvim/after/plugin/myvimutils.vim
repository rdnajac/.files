command! BreakHere call utils#breakHere()

command! ReplaceSelection call utils#replaceSelection()
vnoremap ,r <cmd>ReplaceSelection<CR>

command! QuickFormat call format#buffer()
nnoremap Q <cmd>QuickFormat<CR>

