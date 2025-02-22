-- https://cmp.saghen.dev/
-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/extras/coding/blink.lua
return {
  'Saghen/blink.cmp',
  -- build = 'cargo build --release',
  version = '*',
  event = 'InsertEnter',
  dependencies = {
    { 'saghen/blink.compat', opts = {} },
    { 'giuxtaposition/blink-cmp-copilot' },
    { 'rafamadriz/friendly-snippets', enabled = false },
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    appearance = {
      nerd_font_variant = 'mono',
      -- kind_icons = LazyVim.config.icons.kinds,
    },
    completion = {
      accept = { auto_brackets = { enabled = false } },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = 'single' },
      },
      ghost_text = {
        enabled = true,
        show_with_selection = true,
        show_without_selection = false,
      },
      menu = {
        auto_show = false, -- pull up the completion menu with <c-space>
        border = 'rounded',
        draw = { treesitter = { 'lsp' } },
      },
      -- Controls when to request completion items from the sources and show the completion menu.
      trigger = {
        show_in_snippet = false,
        show_on_keyword = true,
        show_on_trigger_character = true,
        show_on_accept_on_trigger_character = true,
        show_on_insert_on_trigger_character = true,
      },
      -- Manages the completion list and its behavior when selecting items.
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
    },
    signature = { enabled = true, window = { border = 'single' } },

    keymap = {
      preset = 'none',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      -- ['<C-space>'] = { 'show_and_insert', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'cancel' },
      -- FIXME: this make a delay in insert mode when trying to escape
      -- ['<esc>'] = { 'cancel', 'fallback' },
      ['<C-y>'] = { 'select_and_accept' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      ['<C-j>'] = { 'select_and_accept' },
      ['j'] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return cmp.select_next()
          end
        end,
        'fallback',
      },

      ['k'] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return cmp.select_prev()
          end
        end,
        'fallback',
      },

      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      -- TODO: keep continuing filepaths
      -- TODO: can we just make it like zsh?
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        'snippet_forward',
        'fallback',
      },

      ['<Space>'] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return cmp.accept()
          end
        end,
        'fallback',
      },

      -- return ctx.mode ~= "cmdline"
      -- ['<CR>'] = {
      --   function(cmp)
      --     -- if not in cmdline
      --     if vim.fn.mode() ~= 'c' then
      --       if cmp.is_menu_visible() then
      --         return cmp.accept()
      --       end
      --     end
      --   end,
      --   'fallback',
      -- },
    },

    sources = {
      compat = {},
      default = { 'lazydev', 'path', 'lsp', 'buffer', 'copilot' },
      per_filetype = {
        -- lua = { 'lazydev', 'path', 'lsp', 'buffer' },
      },
      cmdline = {
        enabled = false,
        sources = {},
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
            -- get_cwd = function(context) return vim.fn.expand(('#%d:p:h'):format(context.bufnr)) end,
            get_cwd = function(_)
              return vim.fn.getcwd()
            end,
            show_hidden_files_by_default = false,
          },
        },

        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100, -- show at a higher priority than lsp
        },

        copilot = {
          name = 'copilot',
          module = 'blink-cmp-copilot',
          kind = 'Copilot',
          score_offset = 100,
          async = true,
        },
      },
    },
  },
}
