local M = {}

local LazyVimPath = vim.fn.stdpath('data') .. '/lazy/LazyVim'
local LazyVimPluginPath = LazyVimPath .. '/lua/lazyvim/plugins'
local LazyVimConfigPath = LazyVimPath .. '/lua/lazyvim/config'
local LazyVimExtrasPath = LazyVimPath .. '/lua/lazyvim/plugins/extras'
-- local PluginPath = vim.fn.stdpath('config') .. 'lua/plugins'

--- Display a warning message using Neovim's notification system.
--- @param msg string: The warning message to display.
local function warn(msg)
  vim.notify(msg, vim.log.levels.WARN)
end

--- Edit a file if it is readable, otherwise optionally display a warning.
--- @param file string: The path to the file to edit.
--- @param should_warn boolean: Whether to warn if the file is not found.
--- @return boolean: True if the file was successfully edited, false otherwise.
local function edit(file, should_warn)
  if vim.fn.filereadable(file) == 1 then
    -- if we're in a floating window, close it
    if vim.api.nvim_win_get_config(0).relative ~= '' then
      vim.cmd('q')
    end
    vim.cmd('edit ' .. file)
    return true
  else
    if should_warn then
      warn('File not found: ' .. file)
    end
    return false
  end
end

--- Go to the closest README file, up to the git root.
function M.README()
  local readme_files = { 'README.md', 'README.markdown', 'README' }
  local current_dir = vim.fn.expand('%:p:h')
  local git_root = Snacks.git.get_root()

  -- Traverse upwards through the directories
  while current_dir do
    -- Check if any README file exists in the current directory
    for _, filename in ipairs(readme_files) do
      local filepath = current_dir .. '/' .. filename
      if edit(filepath, false) then
        return
      end
    end
    -- If we've reached the git root, break the loop
    if current_dir == git_root then
      break
    end
    -- Otherwise, move up one directory
    current_dir = vim.fn.fnamemodify(current_dir, ':h')
  end
  warn('No README file found in the git repository.')
end

function M.lazy()
  local current_file = vim.fn.expand('%:t')

  -- First check for config files
  local config_files = { 'options.lua', 'keymaps.lua', 'autocmds.lua' }
  for _, file in ipairs(config_files) do
    if current_file == file then
      return edit(LazyVimConfigPath .. '/' .. file, false)
    end
  end

  -- Then check for matching plugin file
  if edit(LazyVimPluginPath .. '/' .. current_file, false) then
    return true
  end

  -- Finally try module-based navigation
  local module_path = vim.fn.expand('<cWORD>'):gsub('[,\'"]', ''):gsub('%.', '/')
  if edit(LazyVimPath .. '/lua/' .. module_path .. '.lua', false) then
    return true
  else
    return edit(LazyVimExtrasPath .. '/' .. module_path .. '.lua', true)
    -- TODO: running this from a 
  end
end

return M
