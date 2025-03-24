local M = {}

-- Path constants
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
    if Snacks.util.is_float() then
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

--- Get the path for a config file based on its type
--- @param file string: The name of the config file without extension
--- @return string: The full path to the config file
local function get_config_path(file)
  -- stylua: ignore
  local config_paths = {
    autocmds = vim.fn.stdpath('config') .. '/lua/config/autocmds.lua',
    keymaps  = vim.fn.stdpath('config') .. '/lua/config/keymaps.lua',
    lazy     = vim.fn.stdpath('config') .. '/lua/config/lazy.lua',
    options  = vim.fn.stdpath('config') .. '/lua/config/options.lua',

    init     = vim.fn.stdpath('config') .. '/init.lua',
    util     = vim.fn.stdpath('config') .. '/lua/util/init.lua',
    munchies = vim.fn.stdpath('config') .. '/lua/util/munchies/init.lua',
  }

  return config_paths[file] or vim.fn.expand(file)
end

--- Edit a configuration file
--- @param file string: The name of the config file to edit
--- @return boolean: True if the file was successfully edited, false otherwise
function M.conf(file)
  local target = get_config_path(file)
  return edit(target, true)
end

--- Navigate to LazyVim or plugin files
--- @return boolean: True if a file was successfully edited, false otherwise
function M.lazy()
  local current_file = vim.fn.expand('%:t')
  local file_to_edit = nil

  -- Check if it's a LazyVim config file
  local config_files = { 'options.lua', 'keymaps.lua', 'autocmds.lua', 'lazy.lua' }
  if vim.tbl_contains(config_files, current_file) then
    file_to_edit = LazyVimConfigPath .. '/' .. current_file
  else
    -- Special cases for specific files
    local special_files = {
      ['blink.lua'] = LazyVimExtrasPath .. '/coding/blink.lua',
      ['lsp.lua'] = LazyVimPluginPath .. '/lsp/',
      ['core.lua'] = LazyVimPluginPath .. '/init.lua',
    }

    if special_files[current_file] then
      file_to_edit = special_files[current_file]
    else
      -- Try matching plugin file
      file_to_edit = LazyVimPluginPath .. '/' .. current_file

      -- If not found, try the Lazy module
      if vim.fn.filereadable(file_to_edit) ~= 1 then
        local module_path = vim.fn.expand('<cWORD>'):gsub('[,\'"]', ''):gsub('%.', '/')
        file_to_edit = LazyVimPath .. '/lua/' .. module_path .. '.lua'

        -- If still not found, try extras path (with warning)
        if vim.fn.filereadable(file_to_edit) ~= 1 then
          return edit(LazyVimExtrasPath .. '/' .. module_path .. '.lua', true)
        end
      end
    end
  end

  return edit(file_to_edit, false)
end

--- Go to the closest README file, up to the git root.
--- @return nil
function M.README()
  local current_dir = vim.fn.expand('%:p:h')
  local git_root = Snacks.git.get_root()

  -- Traverse upwards through the directories
  while current_dir and current_dir ~= '/' and current_dir ~= vim.fn.expand('$HOME') do
    -- Check if any README file exists in the current directory
    for _, filename in ipairs({ 'README.md', 'README.markdown', 'README' }) do
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

  warn('No README file found.')
end

--- Navigate to filetype-specific files
--- @param target string Type of file to edit ("plugin" or "snippets")
--- @return boolean True if the file was successfully edited
function M.ft(target)
  local ft = vim.bo.ft
  if ft == '' then
    warn('No filetype detected for current buffer')
    return false
  end

  local path
  if target == 'plugin' then
    path = vim.fn.stdpath('config') .. '/after/ftplugin/' .. ft .. '.vim'
  elseif target == 'snippets' then
    path = vim.fn.stdpath('config') .. '/snippets/' .. ft .. '.json'
  else
    warn('Invalid target: ' .. target)
    return false
  end

  return edit(path, true)
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
