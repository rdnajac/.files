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
    opts = {},
    keys = {
      { 'ga', mode = 'x', desc = 'Align' },
      { 'gA', mode = 'x', desc = 'Align Visual' },
    },
  },

  ---@module 'blink.cmp'
  {
    'Saghen/blink.cmp', -- https://cmp.saghen.dev/
    dependencies = { { 'rafamadriz/friendly-snippets', enabled = false } },
    ---@type blink.cmp.Config
    opts = {
      completion = {
        accept = { auto_brackets = { enabled = true } },
        documentation = { window = { border = 'single' } },
        menu = {
          draw = {
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'kind_icon', 'kind', 'source_name' },
            },
          },
          auto_show = false,
          border = 'rounded',
        },
      },
      signature = {
        enabled = false,
        window = { border = 'rounded' },
      },

      keymap = {
        preset = 'super-tab',
      },

      cmdline = {
        enabled = false,
        sources = {},
      },

      sources = {
        compat = {},
        -- default = { 'lazydev', 'path', 'lsp', 'snippets' },
        default = { 'snippets' },

        providers = {
          path = {
            name = 'Path',
            module = 'blink.cmp.sources.path',
            score_offset = 333,
            fallbacks = { 'buffer' },
            opts = {
              trailing_slash = true,
              label_trailing_slash = true,
              get_cwd = function(_)
                return vim.fn.getcwd()
              end,
              show_hidden_files_by_default = true,
            },
          },
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
