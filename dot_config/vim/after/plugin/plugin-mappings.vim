let g:copilot_no_maps = v:true
augroup github_copilot_block_suggestions
  autocmd!
  autocmd FileType,BufUnload * call copilot#OnFileType()
augroup END
call copilot#OnFileType()

" comment-out and duplicate line
nmap yc "xyygcc"xp

" surround shortcuts
vmap `  S`
vmap b  Sb
nmap S  viWS
nmap yss ys_

if has('nvim')
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
endif
