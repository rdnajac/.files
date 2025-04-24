runtime! after/ftplugin/vim.vim

" auto close brackets
inoremap <buffer> {<SPACE> {}<LEFT><SPACE><LEFT><SPACE>
inoremap <buffer> {<CR> {<CR>}<ESC>O
imap vim.cmd vim.cmd([[<c-g>u]])<Left><Left><Left><CR><CR><esc>hi<Space><Space>

nnoremap <buffer> mf\ i---@diagnostic disable-next-line: missing-fields<esc>
nnoremap <buffer> ul\ i---@diagnostic disable-next-line: unused-local<esc>
nnoremap <buffer> uf\ i---@diagnostic disable-next-line: undefined-field<esc>

" insert `--stylua: ignore` in normal mode
nmap <buffer> si\ istylua:<SPACE>ignore<esc>gcc
nmap <buffer> sis\ istylua:<SPACE>ignore<SPACE>start<esc>gcc
nmap <buffer> sie\ istylua:<SPACE>ignore<SPACE>end<esc>gcc

iabbrev si  --<SPACE>stylua:<SPACE>ignore
iabbrev <buffer> sis --<SPACE>stylua:<SPACE>ignore<SPACE>start
iabbrev <buffer> sie --<SPACE>stylua:<SPACE>ignore<SPACE>end

" snippets
" lua vim.snippet.add('fn', 'function ${1:name}($2)\n\t${3:-- content}\nend')
" lua vim.snippet.add('lfn', 'local function ${1:name}($2)\n\t${3:-- content}\nend')
