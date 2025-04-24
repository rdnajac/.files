local M = {}

-- Define custom global flags with built-in toggles using Snacks Toggle
local _create_flags = function()
  local flag = require("util.munchies.toggle").flag

  flag({
    name = 'ooze_auto_advance',
    mapping = '<leader>tA',
    desc = 'Toggle Auto Advance',
    label = 'Auto Advance (Line Feed)',
  })

  flag({
    name = 'ooze_auto_scroll',
    mapping = '<leader>ts',
    desc = 'Toggle Auto Scroll',
    label = 'Auto Scroll',
  })

  flag({
    name = 'ooze_send_on_enter',
    default = 0,
    mapping = '<leader>t<CR>',
    desc = 'Toggle Send on Enter',
    label = 'Send Line',
  })

  flag({
    name = 'ooze_auto_exec',
    mapping = '<leader>tx',
    desc = 'Toggle Auto Execute',
    label = 'Auto Execute',
  })

  flag({
    name = 'ooze_skip_comments',
    mapping = '<leader>tk',
    desc = 'Toggle Auto Skip Comments',
    label = 'Skip Comments',
  })
end

-- Use `var` to get the value of the (buffer > global > default) variable
local CR = function()
  if Snacks.util.var(0, 'ooze_send_on_enter', 0) == 1 then
    vim.cmd('call ooze#sendline()')
    vim.cmd('call ooze#linefeed()')
    return ''
  else
    return '<CR>'
  end
end

M.setup = function()
  _create_flags()
  vim.api.nvim_create_user_command('CR', CR, {})
  vim.keymap.set('n', '<CR>', '<Cmd>CR<CR>', { silent = true })
  vim.keymap.set('v', '<CR>', '<Cmd>OozeVisual<CR>', { silent = true })

  vim.cmd([[
    command! RunFile call ooze#runfile()
    nnoremap <silent> ,<CR> <cmd>RunFile<CR>
  ]])
end

return M
