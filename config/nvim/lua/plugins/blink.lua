-- https://cmp.saghen.dev/
-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/extras/coding/blink.lua
return {
  'Saghen/blink.cmp',
  dependencies = {
    { 'rafamadriz/friendly-snippets', enabled = false },
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      accept = { auto_brackets = { enabled = false } },
      documentation = {
        -- auto_show = false,
        window = { border = 'single' },
      },
      ghost_text = {
        enabled = true,
        show_with_selection = true,
        show_without_selection = false,
      },
      menu = {
        auto_show = true, -- pull up the completion menu with <c-space>
        border = 'rounded',
        draw = { treesitter = { 'lsp' } },
      },
      -- Controls when to request completion items from the sources and show the completion menu.
      trigger = {
        show_in_snippet = false,
        -- show_on_keyword = false,
        show_on_trigger_character = true,
        show_on_accept_on_trigger_character = true,
        show_on_insert_on_trigger_character = true,
      },
      -- Manages the completion list and its behavior when selecting items.
      -- default is true for both `preselect` and `auto_insert`
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
    },
    signature = { enabled = true, window = { border = 'single' } },

    keymap = {
      preset = 'super-tab',
      ['<C-e>'] = { 'hide', 'cancel', 'fallback' },
      ['<C-y>'] = { 'select_and_accept' },
      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      -- ['j'] = {
      --   function(cmp)
      --     if cmp.is_menu_visible() then
      --       return cmp.select_next()
      --     end
      --   end,
      --   'fallback',
      -- },
      -- ['k'] = {
      --   function(cmp)
      --     if cmp.is_menu_visible() then
      --       return cmp.select_prev()
      --     end
      --   end,
      --   'fallback',
      -- },
      },

    cmdline = {
      enabled = false,
      sources = {},
    },

    sources = {
      compat = {},
      default = { 'lazydev', 'path', 'lsp', 'buffer', 'snippets' },
      per_filetype = {
        -- lua = { 'lazydev', 'path', 'lsp', 'buffer' },
        sh = { 'path', 'snippets', 'buffer' },
      },

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
              -- return Snacks.git.get_root()
            end,
            show_hidden_files_by_default = true,
          },
        },

        snippets = {
          name = 'Snippets',
          module = 'blink.cmp.sources.snippets',
          -- score_offset = 111,

          opts = {
            friendly_snippets = false,
            search_paths = { vim.fn.stdpath('config') .. '/snippets' },
            global_snippets = { 'all' },
            extended_filetypes = {},
            ignored_filetypes = {},
            get_filetype = function(context)
              return vim.bo.filetype
            end,
            -- Set to '+' to use the system clipboard, or '"' to use the unnamed register
            clipboard_register = nil,
          },
        },

        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100, -- show at a higher priority than lsp
        },

        -- copilot = {
        --   name = 'copilot',
        --   module = 'blink-cmp-copilot',
        --   kind = 'Copilot',
        --   score_offset = 99,
        --   async = true,
        -- },
      },
    },
  },
}
