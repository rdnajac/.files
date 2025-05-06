-- config/nvim/lua/util/file.lua
local M = {}

M.title = function()
  local git_root = Snacks.git.get_root()
  local file_path = vim.fn.expand('%:p')
  if file_path:sub(1, #git_root) == git_root then
    -- vim.cmd('normal gggcO' .. file_path:sub(#git_root + 2))
    vim.cmd('execute "normal! gggcO" .. fnameescape("' .. file_path:sub(#git_root + 2) .. '")')
  else
    warn('File is not within the git root directory')
  end
end

function M.nnn()
  -- start a socket that we can listen for the result on
  local socketname = vim.fn.tempname()
  vim.fn.serverstart(socketname)

  -- generate the nnn command with the right parameters
  local currentLocation = vim.fn.expand('%:p:h')
  local filepickercommand = 'nnn -p - ' .. currentLocation

  -- use nvim --server to "callback" over rpc the result of "filepickercommand"
  local callbackcommand = string.format([[nvim --server %s --remote $(%s) ]], socketname, filepickercommand)

  -- open up the callbackcommand (which already contains the filepickercommand) in a new terminal buffer
  vim.cmd('term ' .. callbackcommand)
  -- when entering the terminal, automatically enter in insert mode
  vim.cmd('startinsert')

  -- lets grab the buffer number of the terminal buffer we just made
  local termbuffnumber = vim.api.nvim_get_current_buf()

  -- upon closing the terminal (aka, when nnn and the callback process exits), delete the buffer
  vim.api.nvim_create_autocmd({ 'TermClose' }, {
    buffer = termbuffnumber,
    command = 'bd ' .. termbuffnumber,
  })
end

M.setup = function()
  vim.api.nvim_create_user_command('NNN', "lua require('util.nnn').start()", {})
  vim.keymap.set('n', '<leader>n', '<Cmd>NNN<CR>')
end

return M
