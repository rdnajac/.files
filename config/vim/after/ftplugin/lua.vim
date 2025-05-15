" WARNING: make sure its compatible!
runtime! after/ftplugin/vim.vim

setlocal formatprg=stylua\ --search-parent-directories\ -

setlocal formatoptions-=o

" auto close brackets
inoremap <buffer> {<SPACE> {}<LEFT><SPACE><LEFT><SPACE>
inoremap <buffer> {<CR> {<CR>}<ESC>O
" imap vim.cmd vim.cmd([[<c-g>u]])<Left><Left><Left><CR><CR><esc>hi<Space><Space>

nnoremap <buffer> mf\ i---@diagnostic disable-next-line: missing-fields<esc>
nnoremap <buffer> ul\ i---@diagnostic disable-next-line: unused-local<esc>
nnoremap <buffer> uf\ i---@diagnostic disable-next-line: undefined-field<esc>

iabbrev <buffer> si  --<SPACE>stylua:<SPACE>ignore
iabbrev <buffer> sis --<SPACE>stylua:<SPACE>ignore<SPACE>start
iabbrev <buffer> sie --<SPACE>stylua:<SPACE>ignore<SPACE>end

" snippets
" lua vim.snippet.add('fn', 'function ${1:name}($2)\n\t${3:-- content}\nend')
" lua vim.snippet.add('lfn', 'local function ${1:name}($2)\n\t${3:-- content}\nend')

" do not highlight vimscript wrapped in `vim.cmd(...)`
if has ('nvim')
  lua vim.api.nvim_set_hl(0, 'LspReferenceText', {})
endif
