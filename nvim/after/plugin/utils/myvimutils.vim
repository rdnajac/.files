command! BreakHere call utils#breakHere()
nnoremap ,l <cmd>BreakHere<CR>

command! ReplaceSelection call utils#replaceSelection()

command! QuickFormat call format#buffer()
nnoremap Q <cmd>QuickFormat<CR>
