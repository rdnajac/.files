local munchies = require('util.munchies')
local toggle = munchies.toggle

-- Define custom global flags with built-in toggles using Snacks Toggle
toggle({
  name = 'cmd_auto_advance',
  default = 1,
  mapping = '<localleader>ta',
  desc = 'Toggle Auto Advance',
  label = 'Auto Advance (Line Feed)'
})
