-- set up utilities
vim.api.nvim_create_user_command('NNN', "lua require('util.nnn').start()", {})
vim.keymap.set('n', '<leader>n', '<Cmd>NNN<CR>')
