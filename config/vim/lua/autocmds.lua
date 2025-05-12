vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
  desc = 'Highlight on yank',
})
