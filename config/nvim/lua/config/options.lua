-- LazyVim options must be set here
-- for all other options, go to ~/.config/nvim/plugin/init.vim
local g = vim.g

g.lazyvim_check_order = false
g.snacks_animate = true
g.autoformat = false
g.ai_cmp = true
g.lazyvim_picker = 'snacks'
g.lazyvim_explorer = 'snacks'

-- silence checkhealth errors
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0


local set = vim.opt

set.backup = true
set.backupdir = vim.fn.stdpath('state') .. '/backup' .. '/'
set.undofile = true
set.undolevels = 10000

-- set.shellcmdflag = '-ic' -- the `c` flag is for interactive shell
set.mousescroll = 'ver:2,hor:0'
set.pumblend = 0
set.shortmess:append({ W = true, I = true, c = true, C = true, a = true })
