return {
  {
    'folke/flash.nvim',
    keys = function()
      -- stylua: ignore
      return {
        { 'f', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
        { 'r', mode = 'o',               function() require('flash').remote() end, desc = 'Remote Flash' },
        { 'F', mode = { 'n', 'o', 'x' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
        { 'R', mode = { 'o', 'x' },      function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
        { '<c-s>', mode = { 'c' },       function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
      }
    end,
  },

  {
    'folke/which-key.nvim',
    ---@class wk.Opts
    opts = function(_, opts)
      opts.keys = {
        scroll_down = '<C-j>',
        scroll_up = '<C-k>',
      }
      opts.sort = { 'local', 'order', 'alphanum', 'mod' }
      opts.spec = {
        {
          mode = { 'n' },
          { '<leader>d', group = 'debug' },
          { '<leader>dp', group = 'profiler' },
        },

        mode = { 'n', 'v' },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        { 'z', group = 'fold' },
        { '<leader>c', group = 'code' },
        { '<leader>g', group = 'git' },
        { '<leader>t', group = 'toggle' },
        { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
        { '<leader>x', group = 'diagnostics/quickfix', icon = { icon = '󱖫 ', color = 'green' } },
        {
          '<leader>b',
          group = 'buffer',
          expand = function()
            return require('which-key.extras').expand.buf()
          end,
        },
        {
          '<c-w>',
          group = 'windows',
          expand = function()
            return require('which-key.extras').expand.win()
          end,
        },
        { '<leader><tab>', group = 'tabs' },

        -- better descriptions
        { 'gx', desc = 'Open with system app' },

        -- keep things tidy
        { '<leader>q', hidden = true },
        { 'g~', hidden = true },
        { 'gc', hidden = true },
      }
    end,
  },

  {
    'folke/todo-comments.nvim',
    opts = {
      highlight = {
        multiline_pattern = '^[^`]*$', -- match multiline lines that don't contain backticks
      },
    },
  },
}
