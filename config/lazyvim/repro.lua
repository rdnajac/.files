-- For reproducing an issue, use the template below.
-- in your config, before LazyVim loads
vim.env.LAZY_STDPATH = '~/repro'
-- load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
vim.opt.rtp:prepend(vim.fn.stdpath('data') .. '/lazy/lazy.nvim')

---@diagnostic disable: missing-fields
require('lazy.minit').repro({
  spec = {
    { 'folke/tokyonight.nvim' },
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
  },
})

vim.cmd([[
colorscheme tokyonight
]])
