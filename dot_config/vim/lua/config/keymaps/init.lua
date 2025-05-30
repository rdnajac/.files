-- stylua: ignore start
require('config.keymaps.escape')
require('config.keymaps.toggles')
require('config.keymaps.pickers')

require('which-key').add({
  { '<leader>.', function() Snacks.scratch() end, desc = 'Toggle Scratch Buffer', },
  { '<leader>/', function() Snacks.picker.grep() end, desc = 'Grep (Root Dir)', icon = { icon = ' ' }, },
  { '<leader>>', function() Snacks.scratch.select() end, desc = 'Select Scratch Buffer', },
  { '<leader>n', function() Snacks.picker.notifications() end, desc = 'Notification History', },
  { '<leader>un', function() Snacks.notifier.hide() end, desc = 'Dismiss All Notifications', },
  { '<leader>,', function() Snacks.picker.buffers() end, desc = 'Buffers', },
  { '<leader>F', function() Snacks.picker.smart() end, desc = 'Smart Find Files', },
  { '<leader>z', function() Snacks.picker.zoxide() end, desc = 'Zoxide', icon = { icon = '󰄻 ' }, },

  { '<leader><space>', function() Snacks.picker() end, desc = 'Pickers', icon = { icons = ' ' }, },
  { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers', },
  { '<leader>fB', function() Snacks.picker.buffers({ hidden = true, nofile = true }) end, desc = 'Buffers (all)', },
  { '<leader>ff', function() Snacks.picker.files({ cwd = Snacks.git.get_root() }) end, desc = 'Explorer (git root)', },
  { '<leader>fF', function() Snacks.picker.files({ cwd = vim.fn.expand('~/GitHub/') }) end, desc = 'Explorer (all repos)', },
  { '<leader>fG', function() Snacks.picker.files({ cwd = vim.fn.expand('~/GitHub/') }) end, desc = 'GitHub Repos', },
  { '<leader>fL', function() Snacks.picker.files({ cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim Files', },
  { '<leader>fp', function() Snacks.picker.files({ cwd = vim.g.plug_home }) end, desc = 'Vim-Plug Plugins', },
  { '<leader>fP', function() Snacks.picker.files({ cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Lazy Plugins', },
  { '<leader>fr', function() Snacks.picker.recent() end, desc = 'Recent' },
  { '<leader>fR', function() Snacks.picker.recent({ filter = { cwd = true } }) end, desc = 'Recent (cwd)', },
  { '<leader>sa', function() Snacks.picker.autocmds() end, desc = 'Autocmds', },
  { '<leader>sb', function() Snacks.picker.lines() end, desc = 'Buffer Lines', },
  { '<leader>sB', function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers', },
  { '<leader>sc', function() Snacks.picker.grep({ cwd = vim.fn.stdpath('config') }) end, desc = 'Grep Config Files', },
  { '<leader>sC', function() Snacks.picker.commands() end, desc = 'Commands', },
  { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics', },
  { '<leader>sD', function() Snacks.picker.diagnostics_buffer() end, desc = 'Buffer Diagnostics', },
  { '<leader>sg', function() Snacks.picker.grep() end, desc = 'Grep (Root Dir)', },
  { '<leader>sG', function() Snacks.picker.grep({ root = false }) end, desc = 'Grep (cwd)', },
  { '<leader>sh', function() Snacks.picker.help() end, desc = 'Help Pages', },
  { '<leader>sH', function() Snacks.picker.highlights() end, desc = 'Highlights', },
  { '<leader>si', function() Snacks.picker.icons() end, desc = 'Icons', },
  { '<leader>sj', function() Snacks.picker.jumps() end, desc = 'Jumps', },
  { '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps', },
  { '<leader>sl', function() Snacks.picker.loclist() end, desc = 'Location List', },
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
  { '<leader>sp', function() Snacks.picker.grep({ cwd = vim.g.plug_home }) end, desc = 'Vim-Plug Plugin File' },
  { '<leader>sP', function() Snacks.picker.grep({ cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Lazy Plugin File', },

  { '<leader>dps', function() Snacks.profiler.scratch() end, desc = 'Profiler Scratch Buffer', },

  { '<leader>fC', function() Snacks.rename.rename_file() end, desc = 'Change (rename) File on disk', },

  { '<leader>gb', function() Snacks.picker.git_log_line() end, desc = 'Git Blame Line', },
  { '<leader>gB', function() Snacks.gitbrowse() end, desc = 'Git Browse (open)', },
  { '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git Diff (hunks)', },
  { '<leader>gs', function() Snacks.picker.git_status() end, desc = 'Git Status', },
  { '<leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git Stash', },

  { '<leader>uC', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes', icon = { icon = ' ', color = 'yellow' }, },
  { '<leader>uz', function() Snacks.zen() end, desc = 'Zen Mode', icon = { icon = ' ', color = 'blue' }, },
})

-- stylua: ignore
if vim.fn.executable('lazygit') == 1 then
  vim.keymap.set('n', '<leader>gg', function() Snacks.lazygit() end,             { desc = 'Lazygit (cwd)' })
  vim.keymap.set('n', '<leader>gf', function() Snacks.picker.git_log_file() end, { desc = 'Git Current File History' })
  vim.keymap.set('n', '<leader>gl', function() Snacks.picker.git_log() end,      { desc = 'Git Log (cwd)' })
end

vim.keymap.set({ 'n', 't' }, ',,', function() Snacks.terminal.toggle() end, { desc = 'Snacks Terminal' })
vim.keymap.set('n', '\\\\', function() Snacks.dashboard.open() end, { desc = 'Open Snacks Dashboard' })
vim.keymap.set('n', '<leader>bd', function() Snacks.bufdelete() end, { desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>bo', function() Snacks.bufdelete.other() end, { desc = 'Delete Other Buffers' })

-- vim.keymap.set('n', 'gp', '<Cmd>e <cfile>:p:h<CR>', { desc = 'Goto Parent Directory' })
vim.keymap.set('n', 'zS', vim.show_pos, { desc = 'Inspect Pos' })
vim.keymap.set('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })
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

vim.keymap.set('n', '<leader>K', '<Cmd>norm! K<CR>', { desc = 'Keywordprg' })
vim.keymap.set('n', '<leader>w', '<Cmd>write<CR>', { desc = 'Save if modified' })
vim.keymap.set('n', '<leader>q', function()
  if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
    -- vim.cmd('bdelete')
    Snacks.bufdelete()
  else
    vim.cmd('quit')
  end
end, { desc = 'Smart Quit' })
vim.keymap.set('n', '<leader>Q', '<Cmd>qa<CR>', { desc = 'Quit All' })

vim.keymap.set('n', '<leader>db', '<Cmd>BlinkCmp status<CR>', { desc = 'Blink' })
vim.keymap.set('n', '<leader>dc', ':=vim.lsp.get_clients()[1].server_capabilities<CR>', { desc = 'LSP Capabilities' })
vim.keymap.set('n', '<leader>dl', '<Cmd>checkhealth lsp<CR>', { desc = 'LSP' })
vim.keymap.set('n', '<leader>ds', '<Cmd>checkhealth snacks<CR>', { desc = 'Snacks Health' })
vim.keymap.set('n', '<leader>dS', ':=require("snacks").meta.get()<CR>', { desc = 'Snacks' })
vim.keymap.set('n', '<leader>dw', ':=vim.lsp.buf.list_workspace_folders()<CR>', { desc = 'LSP Workspace Folders' })

vim.keymap.set('n', '<leader>fD', '<Cmd>Delete!<CR>', { desc = 'Delete File (and buffer) from disk' })

vim.keymap.set('n', '<leader>ga', ':!git add %<CR>', { desc = 'Git Add (file)' })

vim.keymap.set({ 'i', 'n', 's' }, '<esc>', function()
  vim.cmd('noh')
  -- LazyVim.cmp.actions.snippet_stop()
  return '<esc>'
end, { expr = true, desc = 'Escape and Clear hlsearch' })

-- stylua: ignore end
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
vim.keymap.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
vim.keymap.set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
