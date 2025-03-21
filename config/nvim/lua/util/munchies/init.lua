local flag = require('util.munchies.toggle').flag

-- Define custom global flags with built-in toggles using Snacks Toggle
flag({
  name = 'ooze_auto_advance',
  default = 1,
  mapping = '<localleader>ta',
  desc = 'Toggle Auto Advance',
  label = 'Auto Advance (Line Feed)',
})

flag({
  name = 'ooze_auto_scroll',
  default = 1,
  mapping = '<localleader>ts',
  desc = 'Toggle Auto Scroll',
  label = 'Auto Scroll',
})

flag({
  name = 'ooze_send_on_enter',
  default = 1,
  mapping = '<localleader>t<CR>',
  desc = 'Toggle Send on Enter',
  label = 'Send Line',
})

flag({
  name = 'ooze_auto_exec',
  default = 1,
  mapping = '<localleader>tx',
  desc = 'Toggle Auto Execute',
  label = 'Auto Execute',
})

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

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('munchies_terminal', { clear = true }),
  callback = function(args)
    -- args.buf contains the buffer that triggered the autocmd
    if vim.bo[args.buf].filetype == 'snacks_terminal' then
      vim.g.MyTermChannel = vim.bo[args.buf].channel
    end
  end,
  desc = 'Capture most recently opened terminal channel',
})
