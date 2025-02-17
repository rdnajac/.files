return {
  {
    'LazyVim/LazyVim',
    version = false,
    opts = {
      defaults = {
        autocmds = true,
        keymaps = false,
      },
    },
    keys = {
      { '<leader>l', '<cmd>Lazy<CR>', desc = 'Lazy' },
      { '<leader>L', '<cmd>LazyExtras<CR>', desc = 'LazyExtras' },
    },
  },

  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'MunifTanjim/nui.nvim', lazy = true },
  { 'max397574/better-escape.nvim', opts = {}, event = 'VeryLazy' },
}
