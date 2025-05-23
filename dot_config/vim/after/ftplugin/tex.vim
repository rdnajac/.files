" Disable vimtex mapping for `K` in normal mode
let g:vimtex_mappings_disable = {'n': ['K']}

" Set quickfix method based on whether `pplatex` is executable
if executable('pplatex')
  let g:vimtex_quickfix_method = 'pplatex'
else
  let g:vimtex_quickfix_method = 'latexlog'
endif

" -- Correctly setup lspconfig for LaTeX 🚀
"       texlab = {
" 	keys = {
" 	  { "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
" 	},
"       },
