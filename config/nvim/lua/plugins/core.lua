return {
  { 'tpope/vim-tbone' },
  {
    'tpope/vim-eunuch',
    lazy = false,
    keys = {
      { ',D', '<Cmd>Delete!<CR>', desc = 'Delete the file from disk' },
    },
  },
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup
    priority = 1000, -- and before all the other start plugins
    opts = {
      style = 'storm',
      dim_inactive = true,
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false, bold = true },
        sidebars = 'transparent',
        floats = 'transparent',
      },
      -- stylua: ignore
      -- on_highlights = function(hl, c)
      on_highlights = function(hl, _)
        hl['String'] =                { fg = '#39ff14' }
        hl['SpecialFloatingWindow'] = { bg = '#1f2335' }
      end,
    },
  },

  {
    'LazyVim/LazyVim',
    version = false,
    opts = {
      defaults = {
        autocmds = true,
        keymaps = false,
      },
    },
    keys = {
      { '<leader>l', '<cmd>Lazy<CR>', desc = 'Lazy' },
      { '<leader>L', '<cmd>LazyExtras<CR>', desc = 'LazyExtras' },
    },
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'helix',
      plugins = {
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      spec = {
        {
          mode = { 'n', 'v' },
          { '[', group = 'prev' },
          { ']', group = 'next' },
          { 'g', group = 'goto' },
          { 'z', group = 'fold' },
          { '<leader>c', group = 'code' },
          -- { '<leader>d', group = 'debug' }, -- to be used with dap
          { '<leader>dp', group = 'profiler' },
          { '<leader>f', group = 'find' },
          { '<leader>s', group = 'search' },
          { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
          { '<localleader>f', group = 'Files', icon = { icon = ' ', color = 'blue' } },
          { '<locealleader>l', group = 'vimtex', icon = { icon = ' ', color = 'yellow' } },
          -- stylua: ignore start
          { '<leader>b', group = 'buffer',  expand = function() return require('which-key.extras').expand.buf() end, },
          { '<c-w>',     group = 'windows', expand = function() return require('which-key.extras').expand.win() end, },
          -- stylua: ignore end
          { 'gx', desc = 'Open with system app' },
          { 'gc', hidden = true },
        },
      },
    },

    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Keymaps (which-key)',
      },
      {
        '<c-w><space>',
        function()
          require('which-key').show({ keys = '<c-w>', loop = true })
        end,
        desc = 'Window Hydra Mode (which-key)',
      },
    },
  },

  -- session management
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
    init = function()
      require('which-key').add({ { '<leader>p', group = 'Persistence', icon = ' ' } })
    end,
    -- stylua: ignore
    keys = {
      { "<leader>ps", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>pS", function() require("persistence").select() end,desc = "Select Session" },
      { "<leader>pl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>pd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  -- better diagnostics list and others
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = {
      modes = {
        lsp = {
          win = { position = 'right' },
        },
      },
    },
    init = function()
      -- stylua: ignore
      require('which-key').add({
        { '<leader>x', group = 'diagnostics/quickfix' }, icon = { icon = '󱖫 ', color = 'green' },
      })
    end,
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>cs', '<cmd>Trouble symbols toggle<cr>', desc = 'Symbols (Trouble)' },
      { '<leader>cS', '<cmd>Trouble lsp toggle<cr>', desc = 'LSP references/definitions/... (Trouble)' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
      {
        '[q',
        function()
          if require('trouble').is_open() then
            require('trouble').prev({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Previous Trouble/Quickfix Item',
      },
      {
        ']q',
        function()
          if require('trouble').is_open() then
            require('trouble').next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Next Trouble/Quickfix Item',
      },
    },
  },

  -- find and list TODO, HACK, BUG, etc in your project
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble' },
    event = 'LazyFile',
    opts = {},
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
      { "<leader>sT", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    },
  },

  -- configure LuaLS for editing your Neovim config
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    cmd = 'LazyDev',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        { path = 'LazyVim', words = { 'LazyVim' } },
        { path = 'snacks.nvim', words = { 'Snacks' } },
        { path = 'lazy.nvim', words = { 'LazyVim' } },
      },
    },
  },

  { 'folke/flash.nvim', enabled = false },
  { 'max397574/better-escape.nvim', opts = {}, event = 'InsertEnter' },
}
