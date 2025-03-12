-- lua/config/options.lua
local g = vim.g
local set = vim.opt

g.maplocalleader = ','
-- g.lazyvim_check_order = false
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
set.breakindent = true
set.listchars = { trail = '¿', tab = '→ ' }  -- show trailing whitespace and tabs
set.mousescroll = "hor:0"
set.numberwidth = 2
set.pumblend = 0
set.shiftwidth = 8
set.showmatch = true
set.sidescrolloff = 0
set.tabstop = 8
set.timeoutlen = 420
set.undofile = true
set.undolevels = 10000
set.updatetime = 69
set.whichwrap:append("<,>,[,],h,l")

-- default: `ltToOCF`
set.shortmess:append({ W = true, I = true, c = true, C = true, a = true })
-- current: shortmess=oCcTaFltIWO

vim.filetype.add({
  pattern = {
    -- Correctly identify gitconfig files in the alternate directory
    ['.*/git/config'] = 'gitconfig',
    -- This is needed to run the after/ftplugin, but it breaks syntax highlighting
    -- ['.*qmd'] = 'quatro',
  },
})
