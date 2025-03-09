-- config/nvim/lua/util/init.lua
local file = require('util.file')
local goto = require('util.goto')


vim.keymap.set('n', ',fn', file.file_title, { desc = 'Add filename first line' })

vim.keymap.set('n', '\\0', goto.README, { desc = 'Goto Nearest README' })
vim.keymap.set('n', 'gL', goto.lazy, { desc = 'Goto LazyVim config or module' })
vim.keymap.set('n', 'gP', ':!open $(dirname %)<CR>', { desc = 'Goto Parent Directory (in finder)' })

vim.api.nvim_create_user_command('NNN', "lua require('util.nnn').start()", {})

-- TODO: define a function for defining `let g:` flag variable toggles
Snacks.toggle({
  name = 'Auto Advance (Line Feed)',
  get = function()
    return vim.g.cmd_auto_advance == '1'
  end,
  set = function(state)
    vim.g.cmd_auto_advance = state and '1' or '0'
  end,
}):map('<localleader>ta', { desc = 'Toggle Auto Advance' })

