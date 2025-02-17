" auto close brackets
inoremap <buffer> {<SPACE> {}<LEFT><SPACE><LEFT><SPACE>
inoremap <buffer> {<CR> {<CR>}<ESC>O

nnoremap @mf i---@diagnostic disable-next-line: missing-fields<esc>

nmap @si istylua:<SPACE>ignore<esc>gcc
nmap @ss istylua:<SPACE>ignore<SPACE>start<esc>gcc
nmap @se istylua:<SPACE>ignore<SPACE>end<esc>gcc

imap @si --<SPACE>stylua:<SPACE>ignore
imap @ss --<SPACE>stylua:<SPACE>ignore<SPACE>start
imap @se --<SPACE>stylua:<SPACE>ignore<SPACE>end
