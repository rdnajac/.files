vim.keymap.set({ 'i', 'n', 's' }, '<esc>', function()
  vim.cmd('noh')
  LazyVim.cmp.actions.snippet_stop()
  return '<esc>'
end, { expr = true, desc = 'Escape and Clear hlsearch' })

vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
  LazyVim.format({ force = true })
end, { desc = 'Format' })


--------------------------------------------------------------------------------
-- HACK: snacks dashboard weird interaction with lualine causes statusline
-- to be set set upon loading nvim with no args
-- see `global_statusline`
-- FIXME: This doesn't always work for some reason

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  vim.api.nvim_create_augroup = aug('dashboard'),
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

