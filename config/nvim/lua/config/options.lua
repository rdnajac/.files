-- lua/config/options.lua
-- LazyVim options must be set here
-- for all other options, go to `~/.config/nvim/plugin/init.vim`
local g = vim.g
local set = vim.opt

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

set.backup = true
set.backupdir = vim.fn.stdpath('state') .. '/backup' .. '/'
set.undofile = true
set.undolevels = 10000

set.pumblend = 0

-- default: `ltToOCF`
set.shortmess:append({ W = true, I = true, c = true, C = true, a = true })

-- Correctly identify gitconfig files in the alternate directory
vim.filetype.add({
  pattern = {
    ['.*/git/config'] = 'gitconfig',
  },
})
