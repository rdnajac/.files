-- For reproducing an issue, use the template below.
vim.env.LAZY_STDPATH = '~/repro'
load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()

---@diagnostic disable: missing-fields
require('lazy.minit').repro({
  spec = {
    { 'folke/tokyonight.nvim' },
    {
      'folke/noice.nvim',
      dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
      },
      opts = {},
    },
    -- { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
  },
})

vim.cmd([[
colorscheme tokyonight
]])
