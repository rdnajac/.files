require('snacks').setup({
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  -- dashboard = require('munchies.dashboard'),
  explorer = { enabled = true },
  image = { enabled = vim.env.KITTY_INSTALLATION_DIR ~= nil },
  indent = { indent = { only_current = true, only_scope = true } },
  input = { enabled = true },
  notifier = { enabled = false },
  -- notifier = { style = 'fancy', date_format = '%T', timeout = 3000 },
  picker = require('munchies.picker').opts,
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  -- statuscolumn = { left = { 'sign' }, right = { 'git' } },
  terminal = {
    start_insert = true,
    auto_insert = false,
    auto_close = true,
    win = { wo = { winbar = '', winhighlight = 'Normal:SpecialWindow' } },
  },
  words = { enabled = true },
})

_G.dd = _G.dd or function(...)
  Snacks.debug.inspect(...)
end

_G.bt = _G.bt or function()
  Snacks.debug.backtrace()
end

-- Override print to use snacks for `:=` command
vim.print = _G.dd

vim.api.nvim_create_user_command('Scriptnames', function()
  require('munchies.picker').scriptnames()
end, { desc = 'Scriptnames' })
