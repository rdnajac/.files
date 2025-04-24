return {
  {
    'MagicDuck/grug-far.nvim',
    opts = {
      windowCreationCommand = 'botright split',
    },
  },

  {
    'folke/flash.nvim',
    keys = {
      -- { 's', mode = { 'n' }, enabled = false },
      { 'S', mode = { 'n', 'o', 'x' }, enabled = false },
    },
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
      opts.sort = { 'order', 'alphanum', 'mod' }
      opts.spec = {
        {
          mode = { 'n' },
          -- define groups
          { '<leader>d', group = 'debug' },
          { '<leader>dp', group = 'profiler' },
          { '<leader>t', group = 'toggle' },
          { '<leader>x', group = 'diagnostics/quickfix', icon = { icon = '󱖫 ', color = 'green' } },

          -- add icons for existing (vim) keymaps
          { '<leader>A', icon = { icon = ' ', color = 'azure' }, desc = 'Select All' },
          { '<leader>r', icon = { icon = ' ', color = 'azure' } },
          { '<leader>v', icon = { icon = ' ', color = 'azure' } },
        -- stylua: ignore start
          { '<leader>b', group = 'buffer',  expand = function() return require('which-key.extras').expand.buf() end, },
          { '<c-w>',     group = 'windows', expand = function() return require('which-key.extras').expand.win() end, },
          -- stylua: ignore end
        },

        mode = { 'n', 'v' },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        { 'z', group = 'fold' },
        { '<leader>c', group = 'code' },
        { '<leader>g', group = 'git' },

        -- better descriptions
        { 'gx', desc = 'Open with system app' },

        -- keep things tidy
        { 'g~', hidden = true },
        { 'gc', hidden = true },
      }
    end,
  },

  -- Section: todo-comments
  {
    'folke/todo-comments.nvim',
    opts = {
      keywords = { Section = { icon = '󰚟', color = 'title' } },
      -- highlight = { keyword = 'bg', },
      colors = { title = { '#7DCFFF' } },
    },
  },
}
