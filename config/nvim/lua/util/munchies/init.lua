vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  group = vim.api.nvim_create_augroup('munchies_dashboard', { clear = true }),
  callback = function()
    if vim.bo.filetype == 'snacks_dashboard' then
      local original_laststatus = vim.o.laststatus

      vim.cmd('setlocal laststatus=0')
      vim.api.nvim_create_autocmd('BufLeave', {
        buffer = 0,
        once = true,
        callback = function()
          vim.o.laststatus = original_laststatus
        end,
      })
    end
  end,
})
