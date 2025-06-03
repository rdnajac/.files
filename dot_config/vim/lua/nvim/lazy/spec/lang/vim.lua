vim.lsp.enable('vimls')
return {
  'tpope/vim-abolish',
  'tpope/vim-apathy',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  -- 'tpope/vim-scriptease'
  'tpope/vim-surround',
  'tpope/vim-tbone',
  'tpope/vim-unimpaired',
  'lervag/vimtex',
  -- 'vuciv/golf',
  mason_ensure_installed({ 'vim-language-server' }),
}
