return {
  'folke/which-key.nvim',
  lazy = false,

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
  ---@class wk.Opts
  opts = {
    keys = {
      scroll_down = '<C-j>',
      scroll_up = '<C-k>',
    },
    preset = 'helix',
    sort = { 'order', 'alphanum', 'mod' },
    spec = {
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
    },
  },
}
