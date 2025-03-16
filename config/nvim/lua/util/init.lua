-- config/nvim/lua/util/init.lua
local goto = require('util.goto')

vim.keymap.set('n', '\\0', goto.README, { desc = 'Goto Nearest README' })
vim.keymap.set('n', 'gL', goto.lazy, { desc = 'Goto LazyVim config or module' })
vim.keymap.set('n', 'gP', ':!open $(dirname %)<CR>', { desc = 'Goto Parent Directory (in finder)' })

vim.api.nvim_create_user_command('NNN', "lua require('util.nnn').start()", {})
vim.api.nvim_create_user_command('Rename', "lua require('snacks').rename.rename_file()", {})

