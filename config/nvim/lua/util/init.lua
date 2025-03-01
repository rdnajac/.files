-- lua/user/utils/init.lua
require('util.files')
require('util.readme')
require('util.lazy')

-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require('oil').get_current_dir(bufnr)
  if dir then
    return vim.fn.fnamemodify(dir, ':~')
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

-- Register vim commands
vim.api.nvim_create_user_command('Plugins', "=require('lazy').plugins()", {})
vim.api.nvim_create_user_command('NNN', "lua require('util.nnn').start()", {})
