-- config/nvim/lua/util/file.lua
local M = {}

M.title = function()
  local git_root = Snacks.git.get_root()
  local file_path = vim.fn.expand('%:p')
  if file_path:sub(1, #git_root) == git_root then
    vim.cmd('normal ggO' .. printstring)
    vim.cmd('normal gcc')
  else
    -- TODO: use notify
  end
  -- print('File is not within the git root directory')
end

M.quickconfig = function(file)
  local target = ''
  local nvimconfigfiles = { 'autocmds', 'keymaps', 'lazy', 'options' }
  -- if we're in a floating window, close in first
  if vim.api.nvim_win_get_config(0).relative ~= '' then
    vim.cmd('q')
  end

  if vim.tbl_contains(nvimconfigfiles, file) then
    target = vim.fn.stdpath('config') .. '/lua/config/' .. file .. '.lua'
  elseif file == 'util' then
    target = vim.fn.stdpath('config') .. '/lua/util/init.lua'
  else
    target = vim.fn.expand(file)
  end

  if target ~= '' then
    vim.cmd('e ' .. target)
  end
end

M.cd = function(where)
  local path = ''

  if where == 'gitroot' then
    local root = Snacks.git.get_root(vim.fn.expand('%:p:h'))
    if root then
      path = root
    end
  elseif where == 'here' then
    path = vim.fn.expand('%:p:h')
  elseif where == 'last' then
    path = vim.fn.expand('-')
  else
    path = where
  end

  if path ~= '' then
    vim.cmd('cd ' .. path)
  end
  vim.cmd('pwd')
end

return M
