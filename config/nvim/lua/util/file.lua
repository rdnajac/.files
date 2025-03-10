-- config/nvim/lua/util/file.lua
local M = {}

M.file_title = function()
  local git_root = Snacks.git.get_root()
  local file_path = vim.fn.expand('%:p')
  if file_path:sub(1, #git_root) == git_root then
    local printstring = file_path:sub(#git_root + 2)
    vim.cmd('normal ggO' .. printstring)
    vim.cmd('normal gcc')
  else
    print('File is not within the git root directory')
  end
end

return M
