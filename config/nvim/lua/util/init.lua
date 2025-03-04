require('util.files')
local goto = require('util.goto')

vim.keymap.set('n', '\\0', goto.README, { desc = 'Goto Nearest README' })
vim.keymap.set('n', 'gL', goto.lazy, { desc = 'Goto LazyVim config or module' })

vim.api.nvim_create_user_command('NNN', "lua require('util.nnn').start()", {})
