local M = {}

local function _create_flags()
  local flag = require('munchies.toggle').flag

  -- Ooze flags
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

  -- Snacks terminal flags
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
end

local function snacks_terminal_toggle_or_open()
  local var = Snacks.util.var

  local opts = {
    auto_insert = var(0, 'snacks_terminal_auto_insert', 0) == 1,
    start_insert = var(0, 'snacks_terminal_start_insert', 0) == 1,
  }

  local term, created = Snacks.terminal.get(nil, opts)
  if not created and term ~= nil then
    term:toggle()
  end
end

local function CR()
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

  vim.api.nvim_create_user_command('RunFile', function()
    vim.cmd('call ooze#runfile()')
  end, {})

  vim.keymap.set('n', ',<CR>', '<Cmd>RunFile<CR>', { silent = true })
  vim.keymap.set({'n', 't'}, '<C-\\>', snacks_terminal_toggle_or_open, { desc = 'Toggle Snacks Terminal' })
end

return M
