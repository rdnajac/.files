-- For reproducing an issue, use the template below.
-- in your config, before LazyVim loads
vim.env.LAZY_STDPATH = '~/repro'
load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()

---@diagnostic disable: missing-fields
require('lazy.minit').repro({
  spec = {
    { 'folke/tokyonight.nvim' },
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    {
      'neovim/nvim-lspconfig',
      opts = function()
        local keys = require('lazyvim.plugins.lsp.keymaps').get()
        keys[#keys + 1] = {
          'K',
          function()
            return vim.lsp.buf.hover({
              border = 'rounded',
            })
          end,
          desc = 'Hover',
        }
      end,
    },
  },
})

vim.cmd([[
colorscheme tokyonight
]])
