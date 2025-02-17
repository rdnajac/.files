-- lua/user/utils/init.lua
require('util.files')
require('util.readme')
require('util.lazy')

-- TODO:
-- Register some global functions

-- Register vim commands
vim.api.nvim_create_user_command('Plugins', "=require('lazy').plugins()", {})
