return {
  {
    'max397574/better-escape.nvim',
    opts = {},
    event = 'InsertEnter',
  },
  { 'folke/flash.nvim', enabled = false },
  {
    'folke/which-key.nvim',
    opts = function(_, opts)
      opts.keys = {
        scroll_down = '<C-j>',
        scroll_up = '<C-k>',
      }
      opts.spec = {
        mode = { 'n', 'v' },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        { 'z', group = 'fold' },
        { '<leader>c', group = 'code' },
        { '<leader>d', group = 'debug' },
        { '<leader>dp', group = 'profiler' },
        { '<leader>f', group = 'file/find' },
        { '<leader>g', group = 'git' },
        -- { '<leader>gh', group = 'hunks' },
        { '<leader>s', group = 'search' },
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
        { 'gc', hidden = true },
      }
    end,
  },
}
