-- LazyVim options must be set here
-- for all other options, go to ~/.vim/plugin/_init.vim
vim.g.lazyvim_check_order = false
vim.g.snacks_animate = true
vim.g.autoformat = false
vim.g.lazyvim_cmp = 'blink.cmp'
vim.g.ai_cmp = true
-- TODO: why wont these defaults default?
-- vim.g.lazyvim_picker = 'snacks'
-- vim.g.lazyvim_explorer = 'snacks'

local set = vim.opt

set.backup = true
set.backupdir = vim.fn.stdpath('state') .. '/backup' .. '/'
set.undofile = true
set.undolevels = 10000

-- set.shellcmdflag = '-ic' -- the `c` flag is for interactive shell
set.mousescroll = 'ver:2,hor:0'
set.pumblend = 0
set.shortmess:append({ W = true, I = true, c = true, C = true, a = true })
