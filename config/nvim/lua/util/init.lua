-- lua/user/utils/init.lua
require('util.files')
require('util.readme')
require('util.lazy')


-- Register vim commands
vim.api.nvim_create_user_command('PrintPlugins', "=require('lazy').plugins()", {})
vim.api.nvim_create_user_command('PrintSnacks', "=require('snacks').meta.get()", {})
vim.api.nvim_create_user_command('NNN', "lua require('util.nnn').start()", {})
