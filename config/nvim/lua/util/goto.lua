local M = {}

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

--- Determine the corresponding LazyVim configuration file for the current file.
--- @param current_file string: The name of the current file.
--- @return string|nil: The path to the configuration file, or nil if not found.
local function lazy_config(current_file)
  local config_file = { 'options.lua', 'keymaps.lua', 'autocmds.lua' }
  for _, file in ipairs(config_file) do
    if current_file == file then
      return 'lazyvim/config/' .. file
    end
  end
  return nil
end

--- Generate the module path for the word under the cursor.
--- @return string: The module path with '.lua' extension.
local function lazy_module()
  local module_path = vim.fn.expand('<cWORD>'):gsub('[,\'"]', ''):gsub('%.', '/')
  return module_path .. '.lua'
end

--- Go to the corresponding LazyVim file.
function M.lazy()
  local LazyVimPath = vim.fn.stdpath('data') .. '/lazy/LazyVim'
  local current_file = vim.fn.expand('%:t')
  local target_file = lazy_config(current_file) or lazy_module()
  edit(LazyVimPath .. '/lua/' .. target_file, true)
end
return M
