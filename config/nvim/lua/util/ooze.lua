local M = {}

-- Define custom global flags with built-in toggles using Snacks Toggle
local _create_flags = function()
  local flag = require('util.toggle').flag

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
end

-- Use `var` to get the value of the (buffer > global > default) variable
local CR = function()
  if Snacks.util.var(0, 'ooze_send_on_enter', 0) == 1 then
    vim.cmd([[call slime#send(getline(".") .. "\n")]])
    vim.cmd('call ooze#linefeed()')
    return ''
  else
    return '<CR>'
  end
end

M.setup = function()
  _create_flags()

  vim.api.nvim_create_user_command('CR', CR, {})
  vim.keymap.set('n', '<CR>', '<Cmd>CR<CR>', { noremap = true, silent = true })
  -- vim.keymap.set('v', '<CR>', '<Cmd>SendVisual<CR>', { noremap = true, silent = true })
end

return M
