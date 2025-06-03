require('config.options.diagnostics')
require('config.options.lsp')

vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup//'
vim.opt.mousescroll = 'hor:0'
vim.opt.pumblend = 0
-- vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'rounded'

if vim.fn.has('nvim-0.12') == 1 then
  require('config.options.extui')
end
