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
}
