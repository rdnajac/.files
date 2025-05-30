-- stylua: ignore start
require('nvim.config.keymaps.escape')
require('nvim.config.keymaps.pickers')
require('nvim.config.keymaps.toggles')

require('which-key').add({
  { '<leader>.', function() Snacks.scratch() end, desc = 'Toggle Scratch Buffer', },
  { '<leader>>', function() Snacks.scratch.select() end, desc = 'Select Scratch Buffer', },
  -- { '<leader>n', function() Snacks.picker.notifications() end, desc = 'Notification History', },
  -- { '<leader>un', function() Snacks.notifier.hide() end, desc = 'Dismiss All Notifications', },
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
vim.keymap.set('n', '<leader>ga', ':!git add %<CR>', { desc = 'Git Add (file)' })
if vim.fn.executable('lazygit') == 1 then
  vim.keymap.set('n', '<leader>gg', function() Snacks.lazygit() end,             { desc = 'Lazygit (cwd)' })
  vim.keymap.set('n', '<leader>gf', function() Snacks.picker.git_log_file() end, { desc = 'Git Current File History' })
  vim.keymap.set('n', '<leader>gl', function() Snacks.picker.git_log() end,      { desc = 'Git Log (cwd)' })
end

vim.keymap.set({ 'n', 't' }, ',,', function() Snacks.terminal.toggle() end, { desc = 'Snacks Terminal' })
vim.keymap.set('n', '\\\\', function() Snacks.dashboard.open() end, { desc = 'Open Snacks Dashboard' })
vim.keymap.set('n', '<leader>bd', function() Snacks.bufdelete() end, { desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>bo', function() Snacks.bufdelete.other() end, { desc = 'Delete Other Buffers' })

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

vim.keymap.set('n', '<leader>da', '<Cmd>ALEInfo<CR>', { desc = 'Ale' })
vim.keymap.set('n', '<leader>db', '<Cmd>BlinkCmp status<CR>', { desc = 'Blink' })
vim.keymap.set('n', '<leader>dc', ':=vim.lsp.get_clients()[1].server_capabilities<CR>', { desc = 'LSP Capabilities' })
vim.keymap.set('n', '<leader>dl', '<Cmd>checkhealth lsp<CR>', { desc = 'LSP' })
vim.keymap.set('n', '<leader>ds', '<Cmd>checkhealth snacks<CR>', { desc = 'Snacks Health' })
vim.keymap.set('n', '<leader>dS', ':=require("snacks").meta.get()<CR>', { desc = 'Snacks' })
vim.keymap.set('n', '<leader>dw', ':=vim.lsp.buf.list_workspace_folders()<CR>', { desc = 'LSP Workspace Folders' })

vim.keymap.set('n', '<leader>fD', '<Cmd>Delete!<CR>', { desc = 'Delete File (and buffer) from disk' })


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

