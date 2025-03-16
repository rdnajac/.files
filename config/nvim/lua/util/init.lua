-- config/nvim/lua/util/init.lua
require('util.munchies')
vim.api.nvim_create_user_command('NNN', "lua require('util.nnn').start()", {})
vim.api.nvim_create_user_command('Rename', "lua require('snacks').rename.rename_file()", {})
