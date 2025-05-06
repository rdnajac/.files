vim.cmd([[ runtime vimrc ]])

local set = vim.opt

set.backupdir = vim.fn.stdpath('state') .. '/backup//'
set.cmdheight = 0
set.mousescroll = 'hor:0'
set.pumblend = 0

-- default `ltToOCF`
-- current `oCcTaFltIWO`
-- Vim default `filnxtToOS`
set.shortmess:append({ W = true, I = true, c = true, C = true, a = true })

require('Lazy')
