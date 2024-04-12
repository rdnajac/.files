" experimental vim settings

color myowish
set fillchars=fold:\ ,foldopen:▾,foldclose:▸,foldsep:│
set wildmenu
set wildmode=longest:full,full
set fo-=o
set conceallevel=0
set fillchars+=eob:\                " don't show end of buffer as a column of ~
set fillchars+=stl:\                " display spaces properly in statusline
set list listchars=trail:¿,tab:→\   " show trailing whitspace and tabs
set completeopt=menuone,noselect    " show menu even if there's only one match
set report=0                        " display how many replacements were made

function! ReplaceSelection()
    normal! gv"xy
    let sel = getreg('x')
    let rep = input('Replace all instances of "' . sel . '" with: ')
    if rep != ''
      let cmd = ':%s/' . escape(sel, '/\') . '/' . escape(rep, '/\') . '/g'
      exe cmd
    endif
endfunction
xnoremap <leader>r :<C-u>call ReplaceSelection()<CR>

let g:vim_markdown_fenced_languages =[ 'bash=sh', 'python', 'php', 'html', 'c', 'cpp', 'sql', 'vim', 'dockerfile', 'plaintext', 'markdown' ]
