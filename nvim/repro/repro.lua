-- For reproducing an issue, use the template below.
vim.env.LAZY_STDPATH = '~/repro'
load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()

---@diagnostic disable: missing-fields
require('lazy.minit').repro({
  spec = {
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    -- add any other plugins here
  },
})

vim.cmd([[
cmap ?? verbose set?<left><space>
]])
