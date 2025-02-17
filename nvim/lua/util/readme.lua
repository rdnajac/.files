-- lua/user/utils/readme.lua

function README()
  local readme_files = { 'README.md', 'README.markdown', 'README' }
  for _, filename in ipairs(readme_files) do
    local filepath = Snacks.git.get_root() .. '/' .. filename
    if vim.fn.filereadable(filepath) == 1 then
      vim.cmd('edit ' .. filepath)
      return
    end
  end
  print('No README file found at the git root.')
end

vim.cmd([[
command! README lua README()
nnoremap \0 :README<CR>
]])
