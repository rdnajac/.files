return {
  {
    'folke/flash.nvim',
    keys = { 'S', mode = { 'n', 'o', 'x' }, enabled = false },
    opts = { modes = { char = { jump_labels = true } } },
  },
  {
    'folke/which-key.nvim',
    ---@class wk.Opts
    opts = function(_, opts)
      opts.keys = {
        scroll_down = '<C-j>',
        scroll_up = '<C-k>',
      }
      -- opts.sort = { 'local', 'order', 'alphanum', 'mod' }
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
        -- { '<leader>q', hidden = true },
        { 'g~', hidden = true },
        { 'gc', hidden = true },

        -- add icons
        { '<leader>A', icon = { icon = ' ', color = 'azure' } },
        { '<leader>K', icon = { icon = ' ', color = 'azure' } },
        { '<leader>r', icon = { icon = ' ', color = 'azure' } },
        { '<leader>v', icon = { icon = ' ', color = 'azure' } },
      }
    end,
  },

  -- Section: todo-comments
  {
    'folke/todo-comments.nvim',
    opts = {
      keywords = { Section = { icon = '󰚟', color = 'title' }, },
      -- highlight = { keyword = 'bg', },
      colors = { title = { '#7DCFFF' }, },
    },
  },
}
