vim.keymap.set('n', 'zS', vim.show_pos, { desc = 'Inspect Pos' })

vim.keymap.set(
  'n',
  '<leader>ur',
  '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>',
  { desc = 'Redraw/Clear hlsearch/Diff Update' }
)

vim.keymap.set('n', '<leader>cd', function()
  vim.ui.input({ prompt = 'Change Directory: ', default = vim.fn.getcwd() }, function(input)
    if input then
      vim.cmd('cd ' .. input)
    end
    vim.cmd('pwd')
  end)
end, { desc = 'Change Directory' })


vim.keymap.set('n', '<leader>q', function()
  if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
    -- vim.cmd('bdelete')
    Snacks.bufdelete()
  else
    vim.cmd('quit')
  end
end, { desc = 'Smart Quit' })


vim.keymap.set({ 'i', 'n', 's' }, '<esc>', function()
  vim.cmd('noh')
  -- LazyVim.cmp.actions.snippet_stop()
  return '<esc>'
end, { expr = true, desc = 'Escape and Clear hlsearch' })

-- stylua: ignore start
require('which-key').add({
  { '<leader>l', '<Cmd>Lazy<CR>', desc = 'Lazy' },
  { '<leader>L', '<Cmd>LazyExtras<CR>', desc = 'Lazy Extras' },
  { '<leader>R', '<Cmd>restart<CR>', desc = 'Restart Neovim', icon = { icon = '' } },
  { 'gL', function() require('nvim.lazy.goto') end, { desc = 'Goto LazyVim module' }, },

  { '<leader>.', function() Snacks.scratch() end, desc = 'Toggle Scratch Buffer', },
  { '<leader>>', function() Snacks.scratch.select() end, desc = 'Select Scratch Buffer', },
  -- { '<leader>n', function() Snacks.picker.notifications() end, desc = 'Notification History', },
  -- { '<leader>un', function() Snacks.notifier.hide() end, desc = 'Dismiss All Notifications', },

  { '<leader>bd', function() Snacks.bufdelete() end, desc = 'Delete Buffer', mode = 'n' },

  { '<leader>c', group = 'code' },
  { '<leader>cz', function() require("munchies.picker").chezmoi() end, desc = 'Chezmoi', },

  { '<leader>d', group = 'debug' },
  { '<leader>da', '<Cmd>ALEInfo<CR>', desc = 'Ale', mode = 'n' },
  { '<leader>db', '<Cmd>BlinkCmp status<CR>', desc = 'Blink', mode = 'n' },
  { '<leader>dc', ':=vim.lsp.get_clients()[1].server_capabilities<CR>', desc = 'LSP Capabilities', mode = 'n' },
  { '<leader>dl', '<Cmd>checkhealth lsp<CR>', desc = 'LSP', mode = 'n' },
  { '<leader>ds', '<Cmd>checkhealth snacks<CR>', desc = 'Snacks Health', mode = 'n' },
  { '<leader>dS', ':=require("snacks").meta.get()<CR>', desc = 'Snacks', mode = 'n' },
  { '<leader>dw', ':=vim.lsp.buf.list_workspace_folders()<CR>', desc = 'LSP Workspace Folders', mode = 'n' },

  { '<leader>dp', group = 'profiler' },
  { '<leader>dps', function() Snacks.profiler.scratch() end, desc = 'Profiler Scratch Buffer', },

  { '<leader>f', group = 'file/find' },
  { '<leader>fc', function() LazyVim.pick.config_files() end, desc = 'Config Files', },
  { '<leader>fC', function() Snacks.rename.rename_file() end, desc = 'Change (rename) File on disk', },

  { '<leader>s', group = 'search/grep' },
  { '<leader>t', group = 'toggle' },

  { '<leader>g', group = 'git' },
  { '<leader>gb', function() Snacks.picker.git_log_line() end, desc = 'Git Blame Line', },
  { '<leader>gB', function() Snacks.gitbrowse() end, desc = 'Git Browse (open)', },
  { '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git Diff (hunks)', },
  { '<leader>gs', function() Snacks.picker.git_status() end, desc = 'Git Status', },
  { '<leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git Stash', },
  { '<leader>ga', ':!git add %<CR>', desc = 'Git Add (file)', mode = 'n' },
  { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit (cwd)', mode = 'n' },
  { '<leader>gf', function() Snacks.picker.git_log_file() end, desc = 'Git Current File History', mode = 'n' },
  { '<leader>gl', function() Snacks.picker.git_log() end, desc = 'Git Log (cwd)', mode = 'n' },

  { ',,', function() Snacks.terminal.toggle() end, desc = 'Snacks Terminal', mode = { 'n', 't' } },

  { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
  { '<leader>uC', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes', icon = { icon = ' ', color = 'yellow' }, },

  { '<leader>ui', function() vim.show_pos() end, desc = 'Inspect Pos' },
  { '<leader>uz', function() Snacks.zen() end, desc = 'Zen Mode', icon = { icon = ' ', color = 'blue' }, },
})

-- stylua: ignore
require('which-key').add({
  { '<localleader>p', function() Snacks.picker.lazy() end, desc = 'Search for Plugin Spec', },
  { '<leader>/', function() Snacks.picker.grep() end, desc = 'Grep (Root Dir)', icon = { icon = ' ' }, },
  { '<leader>,', function() Snacks.picker.buffers() end, desc = 'Buffers', },
  { '<leader>F', function() Snacks.picker.smart() end, desc = 'Smart Find Files', },
  { '<leader>z', function() Snacks.picker.zoxide() end, desc = 'Zoxide', icon = { icon = '󰄻 ' }, },

  { '<leader>p', group = 'Pickers' },
  { '<leader>P', function() Snacks.picker() end, desc = 'Pickers', icon = { icons = ' ' }, },
  { '<leader>pa', function() Snacks.picker.autocmds() end, desc = 'Autocmds', },
  { '<leader>pb', function() Snacks.picker.buffers() end, desc = 'Buffers', },
  { '<leader>pB', function() Snacks.picker.buffers({ hidden = true, nofile = true }) end, desc = 'Buffers (all)', },
  { '<leader>sc', function() Snacks.picker.cliphist() end, desc = 'Commands', },
  { '<leader>sC', function() Snacks.picker.commands() end, desc = 'Commands', },

  { '<leader>ff', function() Snacks.picker.files({ cwd = Snacks.git.get_root() }) end, desc = 'Explorer (git root)', },
  { '<leader>fF', function() Snacks.picker.files({ cwd = vim.fn.expand('~/GitHub/') }) end, desc = 'Explorer (all repos)', },
  { '<leader>fG', function() Snacks.picker.files({ cwd = vim.fn.expand('~/GitHub/') }) end, desc = 'GitHub Repos', },
  { '<leader>fL', function() Snacks.picker.files({ cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim Files', },
  { '<leader>fp', function() Snacks.picker.files({ cwd = vim.g.plug_home }) end, desc = 'Vim-Plug Plugins', },
  { '<leader>fP', function() Snacks.picker.files({ cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Lazy Plugins', },
  { '<leader>fr', function() Snacks.picker.recent() end, desc = 'Recent' },
  { '<leader>fR', function() Snacks.picker.recent({ filter = { cwd = true } }) end, desc = 'Recent (cwd)', },
  { '<leader>sb', function() Snacks.picker.lines() end, desc = 'Buffer Lines', },
  { '<leader>sB', function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers', },
  { '<leader>sc', function() Snacks.picker.grep({ cwd = vim.fn.stdpath('config') }) end, desc = 'Grep Config Files', },
  { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics', },
  { '<leader>sD', function() Snacks.picker.diagnostics_buffer() end, desc = 'Buffer Diagnostics', },
  { '<leader>sg', function() Snacks.picker.grep() end, desc = 'Grep (Root Dir)', },
  { '<leader>sG', function() Snacks.picker.grep({ root = false }) end, desc = 'Grep (cwd)', },
  { '<leader>sh', function() Snacks.picker.help() end, desc = 'Help Pages', },
  { '<leader>sH', function() Snacks.picker.highlights() end, desc = 'Highlights', },
  { '<leader>si', function() Snacks.picker.icons() end, desc = 'Icons', },
  { '<leader>sj', function() Snacks.picker.jumps() end, desc = 'Jumps', },
  { '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps', },
  { '<leader>sL', function() Snacks.picker.grep({ cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim File', },
  { '<leader>sM', function() Snacks.picker.man() end, desc = 'Man Pages', },
  { '<leader>sm', function() Snacks.picker.marks() end, desc = 'Marks', },
  { '<leader>sq', function() Snacks.picker.qflist() end, desc = 'Quickfix List', },
  { '<leader>sR', function() Snacks.picker.resume() end, desc = 'Resume', },
  { '<leader>su', function() Snacks.picker.undo() end,desc = 'Undotree', },
  { '<leader>sv', function() Snacks.picker.grep({ cwd = vim.fn.expand('~/.config/vim') }) end, desc = 'Find Vim Config File', },
  { '<leader>sV', function() Snacks.picker.grep({ cwd = vim.fn.expand('$VIMRUNTIME') }) end, desc = '$VIMRUNTIME', },
  { '<leader>s:', function() Snacks.picker.command_history() end, desc = 'Command History', },
  { '<leader>s"', function() Snacks.picker.registers() end, desc = 'Registers', },
  { '<leader>s/', function() Snacks.picker.search_history() end, desc = 'Search History', },

  { '<leader>fs', function() Snacks.picker.files({ cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim' }) end, desc = 'Snacks Files', },
  { '<leader>fV', function() Snacks.picker.files({ cwd = vim.fn.expand('$VIMRUNTIME') }) end, desc = '$VIMRUNTIME', },

  { '<leader>sN', function() Snacks.picker.grep({ cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim' }) end, desc = 'Snacks File', },
  { '<leader>sP', function() Snacks.picker.grep({ cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Lazy Plugin File', },
})

  -- better escape " {{{1
local map_combo = require('mini.keymap').map_combo

-- Modes: i = insert, c = command, x = visual, s = select
local modes = { 'i', 'c', 'v', 's' }

-- Map both 'jk' and 'kj' to <Esc> in normal-ish modes
for _, combo in ipairs({ 'jk', 'kj' }) do
  map_combo(modes, combo, '<BS><BS><Esc>')
end

-- Terminal mode: 'jk' and 'kj' to <C-\><C-n>
for _, combo in ipairs({ 'jk', 'kj' }) do
  map_combo('t', combo, '<BS><BS><C-\\><C-n>')
end

-- § edit shortcuts {{{1
-- TODO: use snacks
--- Display a warning message using Neovim's notification system.
--- @param msg string: The warning message to display.
local function warn(msg)
  vim.notify(msg, vim.log.levels.WARN)
end

--- Edit a file if it is readable, otherwise optionally display a warning.
--- @param file string: The path to the file to edit.
--- @param should_warn? boolean: Whether to warn if the file is not found.
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

require('which-key').add({
  { '\\\\', function() Snacks.dashboard.open() end, desc = 'Open Snacks Dashboard' },
  { '\\a', function() edit(vim.fn.stdpath('config') .. '/lua/nvim/config/autocmds.lua') end },
  { '\\o', function() edit(vim.fn.stdpath('config') .. '/lua/nvim/config/options.lua') end },
  { '\\k', function() edit(vim.fn.stdpath('config') .. '/lua/nvim/config/keymaps.lua') end },
  { '\\l', function() edit(vim.fn.stdpath('config') .. '/lua/nvim/lazy/init.lua') end },
})
