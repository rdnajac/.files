local M = {}

M.title = function()
  local git_root = Snacks.git.get_root()
  local file_path = vim.fn.expand('%:p')
  if file_path:sub(1, #git_root) == git_root then
    -- vim.cmd('normal gggcO' .. file_path:sub(#git_root + 2))
    vim.cmd('execute "normal! gggcO" .. fnameescape("' .. file_path:sub(#git_root + 2) .. '")')
  else
    vim.notify('File is not within the git root directory', vim.log.levels.WARN, { title = 'Munchies' })
  end
end

return M
