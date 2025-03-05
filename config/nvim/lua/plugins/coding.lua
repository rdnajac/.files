return {
  { 'echasnovski/mini.pairs', enabled = false },
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
      local map = vim.keymap.set
      map('n', 'S', 'viWys', { remap = true, desc = 'Surround word' })
      map('v', 'S', 'ys', { remap = true, desc = 'Surround selection' })
    end,
  },

  {
    'echasnovski/mini.align',
    event = 'VeryLazy',
    opts = function()
      local wk = require('which-key')
      wk.add({
        mode = { 'v' },
        { 'ga', desc = 'Align' },
        { 'gA', desc = 'Align Visual' },
      })
    end,
  },
}
