return {
  { 'echasnovski/mini.pairs', enabled = false },
  {
    'echasnovski/mini.align',
    opts = {},
    keys = {
      { 'ga', mode = 'x', desc = 'Align' },
      { 'gA', mode = 'x', desc = 'Align Visual' },
    },
  },
  {
    'echasnovski/mini.surround',
    event = 'InsertEnter',
    opts = {
      mappings = {
        add = 'ys',
        delete = 'ds',
        replace = 'cs',
      },
    },
    init = function()
      vim.keymap.set('n', 'S', 'viWys', { remap = true, desc = 'Surround word' })
      vim.keymap.set('v', 'S', 'ys', { remap = true, desc = 'Surround selection' })
    end,
  },

  -- https://codecompanion.olimorris.dev
  {
    'olimorris/codecompanion.nvim',
    enabled = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      strategies = {
        -- Change copilot default chat adapter
        chat = {
          adapter = 'copilot',
        },
      },
      opts = {
        -- Set debug logging
        log_level = 'DEBUG',
      },
    },
  },

  {
    'github/copilot.vim',
    endabled = true,
    event = 'VeryLazy',
    init = function()
      vim.cmd([[
        imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
        let g:copilot_workspace_folders = ["~/GitHub"]
      ]])
    end,
  },
}
