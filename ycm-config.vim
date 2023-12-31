" Configuration file for YouCompleteMe

nnoremap <leader>] :YcmCompleter GoTo<CR>
nnoremap ? <plug>(YCMHover)

let g:ycm_clangd_args = [ '--header-insertion=never' ]

let g:ycm_enable_semantic_highlighting=1
let MY_YCM_HIGHLIGHT_GROUP = {
      \   'typeParameter': 'PreProc',
      \   'parameter': 'Normal',
      \   'variable': 'Normal',
      \   'property': 'Normal',
      \   'enumMember': 'Normal',
      \   'event': 'Special',
      \   'member': 'Normal',
      \   'method': 'Normal',
      \   'class': 'Special',
      \   'namespace': 'Special',
      \ }

for tokenType in keys( MY_YCM_HIGHLIGHT_GROUP )
  call prop_type_add( 'YCM_HL_' . tokenType,
                    \ { 'highlight': MY_YCM_HIGHLIGHT_GROUP[ tokenType ] } )
endfor

"let g:ycm_enable_inlay_hints=1

"    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
"    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
"    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
"    keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
"    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
"    keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
"    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
"    keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", opts)
"    keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
"    keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
"    keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
"    keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
"    keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
"    keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

" Modify below if you want less invasive semantic auto-complete
let g:ycm_semantic_triggers = {
    \   'c,objc' : ['->', '.'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'perl' : ['->'],
    \ }

let g:ycm_complete_in_comments_and_strings = 1
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

set completeopt-=preview

" Optionally suppress all error messages generated by YCM:
let g:ycm_show_diagnostics_ui=0

" Optionally remove automatic identifier-based completion:
" let g:ycm_min_num_of_chars_for_completion = 99

