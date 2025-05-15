return {
  {
    'folke/tokyonight.nvim',
    priority = 1001,
    opts = {
      style = 'storm',
      dim_inactive = true,
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false, bold = true },
        sidebars = 'transparent',
        -- floats = 'transparent',
      },
      on_highlights = function(hl, _)
        hl['Folded'] = { fg = '#7aa2f7', bg = '#16161d' }
        hl['String'] = { fg = '#39ff14' }
        hl['SpecialWindow'] = { bg = '#1f2335' }
        hl['NormalFloat'] = { bg = '#1f2335' }
        hl['SpellBad'] = { bg = '#ff0000' }
        hl['CopilotSuggestion'] = { bg = '#414868', fg = '#7AA2F7' }
      end,
    },
  },

  {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      -- dashboard = require('munchies.dashboard'),
      explorer = { enabled = true },
      image = { enabled = vim.env.KITTY_INSTALLATION_DIR ~= nil },
      indent = { indent = { only_current = true, only_scope = true } },
      input = { enabled = true },
      notifier = { enabled = false },
      -- notifier = { style = 'fancy', date_format = '%T', timeout = 3000 },
      picker = require('munchies.picker').opts,
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = false },
      -- statuscolumn = { left = { 'sign' }, right = { 'git' } },
      terminal = {
        start_insert = true,
        auto_insert = false,
        auto_close = true,
        win = { wo = { winbar = '', winhighlight = 'Normal:SpecialWindow' } },
      },
      words = { enabled = true },
    },
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      show_help = false,
      keys = {
        scroll_down = '<C-j>',
        scroll_up = '<C-k>',
      },
      preset = 'helix',
      sort = { 'order', 'alphanum', 'mod' },
      spec = {
        {
          -- TODO: offload these to keymaps.lua
          mode = { 'n' },
          { '<leader>c', group = 'code' },
          { '<leader>d', group = 'debug' },
          { '<leader>dp', group = 'profiler' },
          { '<leader>s', group = 'search/grep' },
          { '<leader>t', group = 'toggle' },
          { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },

          -- { '<localleader>l', desc = '+vimtex' },
          -- { '<localleader>r', group = '+R', icon = { icon = ' ', color = 'blue' } },
          -- { '<localleader>re', group = '++renv' },

          -- add icons for existing (vim) keymaps
          { '<leader>a', icon = { icon = ' ', color = 'azure' }, desc = 'Select All' },
          { '<leader>r', icon = { icon = ' ', color = 'azure' } },
          { '<leader>v', icon = { icon = ' ', color = 'azure' } },
          { '<leader>ft', icon = { icon = ' ', color = 'azure' } },
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
        },

        mode = { 'n', 'v' },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        { 'z', group = 'fold' },
        { '<leader>g', group = 'git' },

        -- better descriptions
        { 'gx', desc = 'Open with system app' },

        -- keep things tidy
        { 'g~', hidden = true },
        { 'gc', hidden = true },
      },
    },
  },
}
