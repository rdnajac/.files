require('nvim.lazy')
require('nvim.util')

vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('LazyVim', { clear = true }),
  pattern = 'VeryLazy',
  callback = function()
    require('nvim.config')
  end,
})
