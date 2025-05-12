vim.cmd('runtime vimrc')

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.shellharden = 1

vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup//'
-- vim.opt.cmdheight = 0
vim.opt.mousescroll = 'hor:0'
vim.opt.pumblend = 0
-- default `ltToOCF`, current `oCcTaFltIWO`, Vim default `filnxtToOS`
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true, a = true })
vim.opt.winborder = 'rounded'

-- require('vim._extui').enable({})
require('autocmds')
require('diagnostics')
require('keymaps')
require('lsp')
require('treesitter')
require('ui')
require('utils')

require('munchies')

vim.cmd('color tokyonight-night')
