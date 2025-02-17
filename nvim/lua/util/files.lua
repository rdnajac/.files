-- lua/user/utils/files.lua

function AddFileNameToFirstLineAsAComment()
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

function RM()
  local fname = vim.fn.expand('%:p')
  vim.cmd('Delete!')
  Snacks.notify.notify('Deleted ' .. fname)
  vim.cmd('Oil')
end

-- function GoToRepo()
--   -- matches the filename against the refistered lazyspec plugin namr
--   -- if it matches, it opens the plugin directory
--   local file = vim.fn.expand('%:p')
--   local lazypath = vim.fn.stdpath('data') .. '/nvim/lazy'
-- return

vim.cmd([[
command! FileName lua AddFileNameToFirstLineAsAComment()
nnoremap <localleader>fn :FileName<CR>

command! RM lua RM()
nnoremap <localleader>fD RM<CR>
]])
