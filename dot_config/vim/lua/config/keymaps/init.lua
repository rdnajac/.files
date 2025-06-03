-- stylua: ignore start
require('config.keymaps.escape')
require('config.keymaps.pickers')
require('config.keymaps.toggles')


vim.keymap.set('n', 'zS', vim.show_pos, { desc = 'Inspect Pos' })
vim.keymap.set('n', '<Cmd>', vim.show_pos, { desc = 'Inspect Pos' })

require('which-key').add({
  { '<leader>R', '<Cmd>restart<CR>', desc = 'Restart Neovim', icon = { icon = '' } },

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
  { '<leader>fc', function() require("munchies.picker").chezmoi() end, desc = 'Chezmoi', },
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
  { '\\\\', function() Snacks.dashboard.open() end, desc = 'Open Snacks Dashboard', mode = 'n' },

  { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
  { '<leader>uC', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes', icon = { icon = ' ', color = 'yellow' }, },

  { '<leader>ui', function() vim.show_pos() end, desc = 'Inspect Pos' },
  { '<leader>uz', function() Snacks.zen() end, desc = 'Zen Mode', icon = { icon = ' ', color = 'blue' }, },
})

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
