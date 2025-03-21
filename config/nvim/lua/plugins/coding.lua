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

  {
    'Saghen/blink.cmp', -- https://cmp.saghen.dev/
    dependencies = { { 'rafamadriz/friendly-snippets', enabled = false } },
    ---@type blink.cmp.Config
    opts = {
      completion = {
        accept = { auto_brackets = { enabled = false } },
        documentation = { window = { border = 'single' } },
        menu = {
          draw = {
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'kind_icon', 'kind' , 'source_name', },

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
      --   ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      --   ['<C-e>'] = { 'hide' },
      --   ['<C-y>'] = { 'select_and_accept' },
      --
      --   ['<Up>'] = { 'select_prev', 'fallback' },
      --   ['<Down>'] = { 'select_next', 'fallback' },
      --   ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      --   ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
      --
      --   ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      --   ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      --
      --   ['<Tab>'] = { 'snippet_forward', 'fallback' },
      --   ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      --
      --   ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      --   -- ctrl_j to pull up snippets
      --   ['<C-j>'] = {
      --     function(cmp)
      --       cmp.show({ providers = { 'snippets' } })
      --     end,
      --   },
      --
      --   ['J'] = {
      --     function(cmp)
      --       if cmp.is_menu_visible() then
      --         return cmp.select_next()
      --       end
      --     end,
      --     'fallback',
      --   },
      --   ['K'] = {
      --     function(cmp)
      --       if cmp.is_menu_visible() then
      --         return cmp.select_prev()
      --       end
      --     end,
      --     'fallback',
      --   },
      },

      cmdline = {
        enabled = false,
        sources = {},
      },

      sources = {
        compat = {},
        -- default = { 'lazydev', 'path', 'lsp', 'snippets' },
        default = {  'snippets' },

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
