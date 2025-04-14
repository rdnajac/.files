vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.autoformat = false
vim.g.ai_cmp = false
vim.g.lazyvim_picker = 'snacks'
vim.g.lazyvim_explorer = 'snacks'

local set = vim.opt

set.backup = true
set.backupdir = vim.fn.stdpath('state') .. '/backup' .. '/'
set.breakindent = true
set.cmdheight = 0
-- set.inccommand = 'nosplit'
set.listchars = { trail = '¿', tab = '→ ' }
set.mousescroll = 'hor:0'
set.pumblend = 0
set.number = false
set.relativenumber = false
set.shiftwidth = 8
set.showmatch = true
set.sidescrolloff = 0
set.tabstop = 8
set.timeoutlen = 420
-- set.undofile = true
-- set.undolevels = 10000
set.updatetime = 69
set.whichwrap:append('<,>,[,],h,l')
-- BUG: unintended side effects
-- set.winborder = 'rounded'

set.completeopt = { 'menu', 'preview', 'preinsert', 'longest' }
set.foldopen:append({ 'insert', 'jump' })
set.iskeyword:append('_')
set.wildmode = { 'longest:full', 'full' }

-- default: `ltToOCF`
-- current: `shortmess=oCcTaFltIWO`
set.shortmess:append({ W = true, I = true, c = true, C = true, a = true })
