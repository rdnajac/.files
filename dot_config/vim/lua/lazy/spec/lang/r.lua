return {
  {
    'R-nvim/R.nvim',
  },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = { ensure_installed = { 'r_language_server' }, },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'r', 'rnoweb' } },
  },
}
