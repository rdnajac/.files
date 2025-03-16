-- config/nvim/lua/util/file.lua
local M = {}

M.title = function()
  local git_root = Snacks.git.get_root()
  local file_path = vim.fn.expand('%:p')
  if file_path:sub(1, #git_root) == git_root then
    vim.cmd('normal ggO' .. file_path:sub(#git_root + 2))
    vim.cmd('normal gcc')
  else
    local msg = 'File is not within the git root directory'
    vim.notify(msg, vim.log.levels.WARN)
  end
end

return M
