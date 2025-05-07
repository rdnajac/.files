vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup//'
vim.opt.cmdheight = 0
vim.opt.mousescroll = 'hor:0'
vim.opt.pumblend = 0
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true, a = true })
-- default `ltToOCF`
-- current `oCcTaFltIWO`
-- Vim default `filnxtToOS`

require('vim._extui').enable({})
require('nvim.autocmds')
require('nvim.diagnostic')
require('nvim.lsp')
require('nvim.Lazy')
require('nvim.keymaps')
