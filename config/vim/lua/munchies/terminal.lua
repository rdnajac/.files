local function snacks_terminal_open()
  local var = Snacks.util.var

  ---@type snacks.terminal.Opts
  local opts = {
    auto_insert = var(0, 'snacks_terminal_auto_insert', 0) == 1,
    start_insert = var(0, 'snacks_terminal_start_insert', 0) == 1,
  }

  Snacks.terminal.open(opts)
end

vim.keymap.set('n', '<leader>T', snacks_terminal_open, { desc = 'Snacks Terminal with options' })

-- Toggles
local flag = require('util.munchies.toggle').flag

flag({
  name = 'snacks_terminal_auto_insert',
  mapping = '<leader>ti',
  desc = 'Toggle Terminal Auto Insert',
  label = 'Auto Insert (on buffer enter)',
})

flag({
  name = 'snacks_terminal_start_insert',
  mapping = '<leader>tI',
  desc = 'Toggle Terminal Start Insert',
  label = 'Start Insert (on terminal open)',
})
