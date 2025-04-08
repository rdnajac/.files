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
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          vim.keymap.set('n', 'S', 'viWgsa', { remap = true, desc = 'Surround word' })
          vim.keymap.set('v', 'S', 'gsa', { remap = true, desc = 'Surround selection' })
        end,
      })
    end,
  },
}
