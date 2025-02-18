" after/ftplugin/markdown.vim
let g:markdown_fenced_languages = ['sh', 'cpp', 'cuda', 'python', 'vim', 'lua', 'r']

setlocal textwidth=80
setlocal noautoindent

" treat quoted text as comments for easy toggling
setlocal commentstring=>\ %s

" Insert hyperlink from clipboard
vmap <buffer> ,k S]f]a()<Esc>hp

" Turn url into hyperlink
vmap <buffer> <alt-S-K> S)i[]<Left>

" Insert an octothorpe at the beginning of the line that already has text
nnoremap <buffer> <localleader>h ^i#<Space><Esc>
inoremap <buffer> <localleader>h <C-o>i#<Space>

inoremap <buffer> ```c ```cpp<CR><CR>```<Up>
inoremap <buffer> ```p ```python<CR><CR>```<Up>
inoremap <buffer> ```v ```vim<CR><CR>```<Up>

" stdin
inoremap <buffer> `! ```sh<CR><CR>```<Up>
" stdout
inoremap <buffer> `$ ```console<CR><CR>```<Up>

inoremap <buffer> <! <!--<Space>--><Left><Left><Left><Left><Space>


if has('nvim')
  finish
endif
let g:markdown_syntax_conceal = 1
let g:markdown_folding        = 1

call greek#setupmappings()

" increment/decrement headings with C-a and C-x
" dial handles these in nvim
nnoremap <buffer> <C-a> :call IncHeading()<CR>
nnoremap <buffer> <C-x> :call DecHeading()<CR>

function! IncHeading()
  let line = getline('.')
  let level = len(matchstr(line, '^#\+'))
  if level < 6
    let new_line = substitute(line, '^#\+', repeat('#', level + 1), '')
    call setline('.', new_line)
  endif
endfunction

function! DecHeading()
  let line = getline('.')
  let level = len(matchstr(line, '^#\+'))
  if level > 1
    let new_line = substitute(line, '^#\+', repeat('#', level - 1), '')
    call setline('.', new_line)
  endif
endfunction

function! s:MyFoldLevel()
  return s:headingDepth(v:lnum) > 0 ? ">1" : "="
endfunction

function! s:headingDepth(lnum)
  return (s:isFenced(a:lnum) ? 0 : len(matchstr(getline(a:lnum), '^#\{1,6}')))
endfunction

function! s:isFenced(lnum)
  return (synIDattr(synID(a:lnum, 1, 1), "name") =~? 'markdownCodeBlock') ? 1 : 0
endfunction

function! s:MyFoldText()
  let level = s:headingDepth(v:foldstart)
  let indent = repeat('#', level)
  let title = substitute(getline(v:foldstart), '^#\+\s\+', '', '')
  let foldsize = (v:foldend - v:foldstart)
  let leading_spaces = (level < 6) ? repeat(' ', 6 - level) : ' '
  let title_width = strdisplaywidth(title)
  let trailing_spaces = (title_width < 40) ? repeat(' ', 40 - title_width) : ' '
  let linecount = '[' . foldsize . ' line' . (foldsize > 1 ? 's' : '') . ']'
  return indent . leading_spaces .title . trailing_spaces . linecount
endfunction
