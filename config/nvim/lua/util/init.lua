-- config/nvim/lua/util/init.lua
local file = require('util.file')
local goto = require('util.goto')
local toggle = require('util.toggle').toggle

vim.keymap.set('n', ',fn', file.title, { desc = 'Add filename to first line' })

vim.keymap.set('n', '\\0', goto.README, { desc = 'Goto Nearest README' })
vim.keymap.set('n', 'gL', goto.lazy, { desc = 'Goto LazyVim config or module' })
vim.keymap.set('n', 'gP', ':!open $(dirname %)<CR>', { desc = 'Goto Parent Directory (in finder)' })

vim.api.nvim_create_user_command('NNN', "lua require('util.nnn').start()", {})
vim.api.nvim_create_user_command('Rename', "lua require('snacks').rename.rename_file()", {})

-- Define custom global flags with built-in toggles using Snakcs Toggle
toggle({
  name = 'cmd_auto_advance',
  default = 1,
  mapping = '<localleader>ta',
  desc = 'Toggle Auto Advance',
  label = 'Auto Advance (Line Feed)'
})
