-- TODO: define a function for defining `let g:` flag variable toggles

Snacks.toggle({
  name = 'Auto Advance (Line Feed)',
  get = function()
    return vim.g.cmd_auto_advance == '1'
  end,
  set = function(state)
    vim.g.cmd_auto_advance = state and '1' or '0'
  end,
}):map('<localleader>ta', { desc = 'Toggle Auto Advance' })

