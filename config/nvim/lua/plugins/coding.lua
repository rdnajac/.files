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
      search_method = 'cover_or_next',
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          local map = vim.keymap.set
          map('v', '`', 'ys`', { remap = true, desc = 'Surround selection with backticks' })
          map('v', 'b', 'ys`', { remap = true, desc = 'Surround selection (bold)' })
          map('v', 'S', 'ys', { remap = true, desc = 'Surround selection' })
          map('n', 'S', 'viWys', { remap = true, desc = 'Surround WORD' })
          map('n', 'yss', 'ys_', { remap = true, desc = 'Surround line' })
        end,
      })
    end,
  },
}
