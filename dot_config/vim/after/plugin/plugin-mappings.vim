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
