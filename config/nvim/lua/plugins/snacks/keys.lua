-- stylua: ignore
return {
  { '<leader><space>', function() Snacks.picker.smart() end,     desc = 'Smart Find Files' },
  { '<leader>,', function() Snacks.picker.buffers() end,         desc = 'Buffers' },
  { '<leader>/', function() Snacks.picker.grep() end,            desc = 'Grep' },
  { '<leader>:', function() Snacks.picker.command_history() end, desc = 'Command History' },
  -- { '<leader>n', function() Snacks.picker.notifications() end,   desc = 'Notification History' },
  { '<leader>e', function() Snacks.explorer() end,               desc = 'File Explorer' },

  -- find
  { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
  { "<leader>fB", function() Snacks.picker.buffers({ hidden = true, nofile = true }) end, desc = "Buffers (all)" },
  { '<leader>fc', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = 'Neovim Config File' },
  -- { '<leader>fc', function() Snacks.picker.grep({ cwd = vim.fn.stdpath('config') }) end, desc = 'Neovim Config File' },
  { '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },
  { "<leader>fF", function() Snacks.picker.files({ root = false }) end, desc = "Find Files (cwd)" },
  { '<leader>fg', function() Snacks.picker.git_files() end, desc = 'Git Files' },
  { '<leader>fp', function() Snacks.picker.projects() end, desc = 'Projects' },
  { '<leader>fP', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Plugins' },
  { '<leader>fr', function() Snacks.picker.recent() end, desc = 'Recent' },
  { "<leader>fR", function() Snacks.picker.recent({ filter = { cwd = true }}) end, desc = "Recent (cwd)" },
  -- mine
  { '<leader>f<Space>', function() Snacks.picker() end, desc = 'Pickers' },
  { '<leader>fs', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim' }) end, desc = 'Snacks File' },
  { '<leader>fL', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim File' },
  { '<leader>fv', function() Snacks.picker('files', {cwd = vim.fn.expand('~/.config/vim')}) end, desc = 'Find Vim Config File' },
  { '<leader>fV', function() Snacks.picker('files', {cwd = vim.fn.expand('$VIMRUNTIME')}) end, desc = '$VIMRUNTIME' },
  { '<leader>f.', function() Snacks.picker.dotfiles() end, desc = 'Dotfiles' },

  -- git
  { '<leader>gb', function() Snacks.git.blame_line() end,      desc = 'Git Blame Line' },
  { '<leader>gB', function() Snacks.gitbrowse() end,           desc = 'Git Browse', mode = { 'n', 'v' } },
  { '<leader>gC', function() Snacks.picker.git_log() end,      desc = 'Git Log' },
  { '<leader>gd', function() Snacks.picker.git_diff() end,     desc = 'Git Diff (Hunks)' },
  { '<leader>gf', function() Snacks.lazygit.log_file() end,    desc = 'Lazygit Current File History' },
  { '<leader>gf', function() Snacks.picker.git_log_file() end, desc = 'Git Log File' },
  { '<leader>gg', function() Snacks.lazygit() end,             desc = 'Lazygit' },
  { '<leader>gl', function() Snacks.picker.git_log() end,      desc = 'Git Log' },
  { '<leader>gL', function() Snacks.picker.git_log_line() end, desc = 'Git Log Line' },
  { '<leader>gs', function() Snacks.picker.git_status() end,   desc = 'Git Status' },
  { '<leader>gS', function() Snacks.picker.git_stash() end,    desc = 'Git Stash' },

  -- grep
  { '<leader>sb', function() Snacks.picker.lines() end,        desc = 'Buffer Lines' },
  { '<leader>sB', function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers' },
  { '<leader>sg', function() Snacks.picker.grep() end,         desc = 'Grep' },
  { '<leader>sw', function() Snacks.picker.grep_word() end,    desc = 'Visual selection or word', mode = { 'n', 'x' } },
  { '<leader>sw', function() Snacks.picker.grep_word() end,    desc = 'Visual selection or word', mode = { 'n', 'x' } },
  { '<leader>un', function() Snacks.notifier.hide() end,       desc = 'Dismiss All Notifications' },

  -- search
  { '<leader>s"', function() Snacks.picker.registers() end,          desc = 'Registers' },
  { '<leader>s/', function() Snacks.picker.search_history() end,     desc = 'Search History' },
  { '<leader>sa', function() Snacks.picker.autocmds() end,           desc = 'Autocmds' },
  { '<leader>sb', function() Snacks.picker.lines() end,              desc = 'Buffer Lines' },
  { '<leader>sc', function() Snacks.picker.command_history() end,    desc = 'Command History' },
  { '<leader>sC', function() Snacks.picker.commands() end,           desc = 'Commands' },
  { '<leader>sd', function() Snacks.picker.diagnostics() end,        desc = 'Diagnostics' },
  { '<leader>sD', function() Snacks.picker.diagnostics_buffer() end, desc = 'Buffer Diagnostics' },
  { '<leader>sh', function() Snacks.picker.help() end,               desc = 'Help Pages' },
  { '<leader>sH', function() Snacks.picker.highlights() end,         desc = 'Highlights' },
  { '<leader>si', function() Snacks.picker.icons() end,              desc = 'Icons' },
  { '<leader>sj', function() Snacks.picker.jumps() end,              desc = 'Jumps' },
  { '<leader>sk', function() Snacks.picker.keymaps() end,            desc = 'Keymaps' },
  { '<leader>sl', function() Snacks.picker.loclist() end,            desc = 'Location List' },
  { '<leader>sm', function() Snacks.picker.marks() end,              desc = 'Marks' },
  { '<leader>sM', function() Snacks.picker.man() end,                desc = 'Man Pages' },
  { '<leader>sp', function() Snacks.picker.lazy() end,               desc = 'Search for Plugin Spec' },
  { '<leader>sq', function() Snacks.picker.qflist() end,             desc = 'Quickfix List' },
  { '<leader>sR', function() Snacks.picker.resume() end,             desc = 'Resume' },
  { '<leader>su', function() Snacks.picker.undo() end,               desc = 'Undo History' },
  { '<leader>co', function() Snacks.picker.colorschemes() end,       desc = 'Colorschemes' },
  -- mine
  { '<leader>sN', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim' }) end, desc = 'Snacks File' },
  { '<leader>sL', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim File' },
  { '<leader>sP', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Lazy Plugin File' },
  { '<leader>s.', function() Snacks.picker('grep', {cwd = vim.fn.expand('$DOTDIR'), hidden = true}) end, desc = 'Dotfiles' },

  -- LSP
  { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
  { 'gD', function() Snacks.picker.lsp_declarations() end, desc = 'Goto Declaration' },
  { 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References' },
  { 'gI', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementation' },
  { 'gy', function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto T[y]pe Definition' },
  { '<leader>ss', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols' },
  { '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' },

  -- buffers
  { '<leader>bd', function() Snacks.bufdelete() end, desc = 'Delete Buffer' },
  { '<leader>bD', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' } },
  { '<leader>bo', function() Snacks.bufdelete.other() end, { desc = 'Delete Other Buffers' }},

  { '<leader>cR',  function() Snacks.rename.rename_file() end, desc = 'Rename File' },

  { '<leader>fT', function() Snacks.terminal() end,  desc = 'Terminal (cwd)'  },
  { '<leader>ft', function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, desc = 'Terminal (Root Dir)'  },
  { '<c-/>',      function() Snacks.terminal() end, desc = 'Togle Terminal' }, -- BUG: this isn't working
  { '<c-_>',      function() Snacks.terminal() end, desc = 'which_key_ignore' },

  { ']]',         function() Snacks.words.jump(vim.v.count1) end, desc = 'Next Reference', mode = { 'n', 't' } },
  { '[[',         function() Snacks.words.jump(-vim.v.count1) end, desc = 'Prev Reference', mode = { 'n', 't' } },
  {
    '<leader>N',
    desc = 'Neovim News',
    function()
      Snacks.win({
        file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
        width = 0.6,
        height = 0.6,
        wo = {
          spell = false,
          wrap = false,
          signcolumn = 'yes',
          statuscolumn = ' ',
          conceallevel = 3,
        },
      })
    end,
  }
}
