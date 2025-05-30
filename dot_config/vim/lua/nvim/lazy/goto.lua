local LazyVimPath = vim.fn.stdpath('data') .. '/lazy/LazyVim'

local ft = vim.bo.filetype
local word = vim.fn.expand('<cWORD>'):gsub('[,\'"]', ''):gsub('%.', '/')
local target

if ft == 'lazy' then
  target = LazyVimPath .. '/lua/lazyvim/plugins/extras/' .. word .. '.lua'
elseif ft == 'lua' then
  target = LazyVimPath .. '/lua/' .. word .. '.lua'
else
  vim.notify('Unsupported filetype: ' .. ft, vim.log.levels.WARN)
  return
end

if vim.fn.filereadable(target) == 1 then
  if Snacks.util.is_float() then
    vim.cmd('q')
  end
  vim.cmd('edit ' .. target)
else
  vim.notify('File not found: ' .. target, vim.log.levels.WARN)
end
