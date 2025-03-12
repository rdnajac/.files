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

  ---@module 'blink.cmp'
  {
    'Saghen/blink.cmp',
    dependencies = { { 'rafamadriz/friendly-snippets', enabled = false } },
    ---@type blink.cmp.Config
    opts = {
      completion = {
        accept = { auto_brackets = { enabled = false } },
        documentation = { window = { border = 'single' } },
        menu = {
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
        ['J'] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_next()
            end
          end,
          'fallback',
        },
        ['K'] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_prev()
            end
          end,
          'fallback',
        },
      },

      cmdline = {
        enabled = false,
        sources = {},
      },

      sources = {
        compat = {},
        default = { 'lazydev', 'path', 'lsp', 'snippets' },

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
              global_snippets = { 'all' },
              extended_filetypes = {},
              ignored_filetypes = {},
              get_filetype = function(_)
                return vim.bo.filetype
              end,
              -- Set to '+' to use the system clipboard, or '"' to use the unnamed register
              clipboard_register = nil,
            },
          },
        },
      },
    },
  },
}
