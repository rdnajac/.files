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

-- Function that maps CR
-- Use `var` to get the value of the (buffer > global > default) variable
function MapCR()
  if Snacks.util.var(0, 'ooze_send_on_enter', 0) == 1 then
    vim.cmd('call ooze#sendline()')
    vim.cmd('call ooze#linefeed()')
    return ''
  else
    return '<CR>'
  end
end

vim.api.nvim_create_user_command('CR', MapCR, {})
vim.cmd([[
nnoremap <CR> <Cmd>CR<CR>
vnoremap <silent> <CR> <cmd>SendVisual<CR>
]])

