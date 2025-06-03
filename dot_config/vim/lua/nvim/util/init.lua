require('nvim.util.oil')
vim.keymap.set('v', '<leader>k', require('nvim.util.link').linkify, { desc = 'Linkify visual selection' })
