local flag = require('util.munchies.toggle').flag

-- Define custom global flags with built-in toggles using Snacks Toggle
flag({
  name = 'cmd_auto_advance',
  default = 1,
  mapping = '<localleader>ta',
  desc = 'Toggle Auto Advance',
  label = 'Auto Advance (Line Feed)'
})

flag({
  name = 'cmd_auto_scroll',
  default = 1,
  mapping = '<localleader>ts',
  desc = 'Toggle Auto Scroll',
  label = 'Auto Scroll'
})

flag({
  name = 'cmd_send_on_enter',
  default = 0,
  mapping = '<localleader>t<CR>',
  desc = 'Toggle Send on Enter',
  label = 'Send Line'
})
