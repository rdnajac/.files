vim.lsp.enable('vimls')
return {
  -- 'tpope/vim-scriptease'
  -- 'vuciv/golf',
  mason_ensure_installed({ 'vim-language-server' }),
}
