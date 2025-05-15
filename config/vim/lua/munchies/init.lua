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
