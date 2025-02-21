-- lua/user/utils/lazy.lua
-- TODO: add shortcuts to open webpages like
-- https://www.lazyvim.org/keymaps
-- https://www.lazyvim.org/configuration/general

local LazyVimPath = vim.fn.stdpath('data') .. '/lazy/LazyVim'

local edit = function(file)
  if vim.fn.filereadable(file) == 1 then
    vim.cmd('edit ' .. file)
  else
    vim.notify('File not found: ' .. file, 'warn')
  end
end

local goto_lazy_module = function()
  local module_path = vim.fn.expand('<cWORD>')

  -- TODO: combine these
  module_path = module_path:gsub(',$', '')
  module_path = module_path:gsub("'", '')
  module_path = module_path:gsub('"', '')

  local target_file = LazyVimPath .. '/lua/' .. module_path:gsub('%.', '/') .. '.lua'

  edit(target_file)
end

local config = { 'options.lua', 'keymaps.lua', 'autocmds.lua' }

local function goto_lazy()
  local current_file = vim.fn.expand('%:t')

  for _, file in ipairs(config) do
    if current_file == file then
      local target_file = LazyVimPath .. '/lua/lazyvim/config/' .. file
      edit(target_file)
      return
    end
  end

  -- TODO: only do this in certain files
  goto_lazy_module()
end

vim.keymap.set('n', 'gL', goto_lazy, { desc = 'Goto LazyVim config or module' })
