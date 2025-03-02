" ~/.vim/autoload/ui.vim
scriptencoding utf-8

let s:filetype_emojis = {
      \ 'py':       '🐍',
      \ 'sh':       '🐚',
      \ 'vim':      '🛠️',
      \ 'markdown': '📜',
      \ 'html':     '🌐',
      \ 'css':      '🎨',
      \ 'R':        '📊',
      \ }

let s:modified = '📝'

function! s:get_filetype_emoji(buf) abort
  if getbufvar(a:buf, '&modified')
    return s:modified
  else
    return get(s:filetype_emojis, getbufvar(a:buf, '&filetype'), '💾')
  endif
endfunction

function! s:get_filename(buf) abort
  let filename = fnamemodify(bufname(a:buf), ':t')
  return !empty(filename) ? filename : '[∅]'
endfunction

function! ui#tabline() abort
  let line = ''
  let current_buf = bufnr('%')

  " Iterate over all listed buffers and create the tabline string
  for buf in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    let s = '%' . buf . 'T' . (buf == current_buf ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . s:get_filetype_emoji(buf) .  ' ' . s:get_filename(buf) . ' ' 
    let line .= s
  endfor

  return line . '👾'
endfunction

function! ui#statusline() abort
  let l:statusline = ''
  " File path, modified flag, file type, read-only flag
  " let l:statusline .= ' %F %y %r'
  " let l:statusline .= FugitiveStatusline()
  let l:statusline .= '👾'
  let l:statusline .= ' %F'
  let l:statusline .= ' %m'
  let l:statusline .= ' %y'

  let l:statusline .= '%='
  " ASCII and hex value of char under cursor
  " let l:statusline .= 'ascii: %3b hex: 0x%02B'
  let l:statusline .= '%S'
  let l:statusline .= ' [%2v,%P]'

  return l:statusline
endfunction

" lualine
" statusline=%#lualine_a_command# COMMAND %#lualine_transitional_lualine_a_command_to_lualine_b_command#%#lualine_b_command#  main %#lualine_transitional_lualine_b_command_to_lualine_c_6_command#%<%#lualine_c_6_command# 󱉭  .files %#lualine_c_normal#%#lualine_c_filetype_MiniIconsGreen_command#  %#lualine_c_normal#%#lualine_c_normal#%#lualine_c_9_LV_Bold_command# ui.vim%#lualine_c_normal# %#lualine_c_normal#%#TroubleStatusline0# 󰊕 %*%#TroubleStatusline1#ui#tabline%*  %#lualine_c_normal#%=%#lualine_x_12_command#   %#lualine_c_normal#%#lualine_x_13_command# : %#lualine_transitional_lualine_b_command_to_lualine_x_13_command#%#lualine_b_command# 48%% %#lualine_b_command# 38:3  %#lualine_transitional_lualine_a_command_to_lualine_b_command#%#lualine_a_command#  16:27 

function! ui#qf_signs() abort
  call sign_define('QFError',{'text':'💩'})
  call sign_unplace('*')
  let s:qfl = getqflist()
    for item in s:qfl
      call sign_place(0, '', 'QFError', item.bufnr, {'lnum': item.lnum})
    endfor
endfunction

" TODO:
function! s:toggle(opt, default) abort
  execute 'if &'.a:opt.' == '.a:default.' | '.'set '.a:opt.'=0 | '.'else | '.'set '.a:opt.'='.a:default.' | '.'endif '
endfunction

" nnoremap <localleader>st :call <SID>toggle('showtabline', 2)<CR>
" nnoremap <localleader>ss :call <SID>toggle('laststatus', 2)<CR>
" nnoremap <localleader>sc :call <SID>toggle('colorcolumn', 81)<CR>
