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
    'Saghen/blink.cmp',
    dependencies = { { 'rafamadriz/friendly-snippets', enabled = false } },
    opts = {
      completion = {
        accept = { auto_brackets = { enabled = false } },
        documentation = { window = { border = 'single' } },
      },
      signature = { window = { border = 'rounded' } },
      keymap = { preset = 'super-tab' },
      cmdline = { enabled = false, sources = {} },
      sources = {
        providers = {
          snippets = {
            name = 'Snippets',
            module = 'blink.cmp.sources.snippets',
            opts = {
              friendly_snippets = false,
              search_paths = { vim.fn.stdpath('config') .. '/snippets' },
            },
          },
        },
      },
    },
  },
}
