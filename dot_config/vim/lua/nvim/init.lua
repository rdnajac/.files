require('nvim.lazy')
require('nvim.util')
local group = vim.api.nvim_create_augroup('LazyVim', { clear = true })
vim.api.nvim_create_autocmd('User', {
  group = group,
  pattern = 'VeryLazy',
  callback = function()
    require('nvim.config')
  end,
})
