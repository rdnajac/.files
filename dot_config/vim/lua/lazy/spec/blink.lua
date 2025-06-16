return {
  -- https://cmp.saghen.dev/
  'Saghen/blink.cmp',
  dependencies = {
    'mgalliou/blink-cmp-tmux',
    'fang2hou/blink-copilot',
    'moyiz/blink-emoji.nvim',
    'bydlw98/blink-cmp-env',
    'hrsh7th/nvim-cmp',
  },
  build = 'cargo build --release',
  event = 'InsertEnter',
  opts = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'BlinkCmpAccept',
      callback = function(ev)
        local item = ev.data.item
        if item.kind == require('blink.cmp.types').CompletionItemKind.path then
          vim.defer_fn(function()
            require('blink.cmp').show()
          end, 10)
        end
      end,
      desc = 'Keep completing path on <Tab>',
    })

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    return {
      signature = { enabled = true },
      cmdline = { enabled = false },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        menu = {
          auto_show = true,
          draw = {
            treesitter = { 'lsp' },
            columns = { { 'kind_icon' }, { 'label', 'label_description', 'source_name', gap = 1 } },
          },
        },
      },
      keymap = {
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<Tab>'] = {
          function(cmp)
            return cmp.snippet_active() and false or cmp.select_and_accept()
          end,
          'snippet_forward',
          'fallback',
        },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-k>'] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_prev()
            end
          end,
          'show_signature',
          'hide_signature',
          'fallback',
        },
        ['<C-j>'] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_next()
            end
          end,
          'fallback',
        },
      },
      sources = {
        default = function()
          local default_sources = { 'lsp', 'path', 'buffer', 'copilot',         'emoji', 'env', 'lazydev' }
          local extra_sources = { 'snippets' }
          local row, col = unpack(vim.api.nvim_win_get_cursor(0))
          row = row - 1
          local check_col = col > 0 and col - 1 or col
          local ok, node = pcall(vim.treesitter.get_node, { pos = { row, check_col } })
          if
            ok
            and node
            and vim.tbl_contains({ 'comment', 'comment_content', 'line_comment', 'block_comment' }, node:type())
          then
            return default_sources
          elseif vim.bo.filetype == 'lua' then
            return { 'lsp', 'path', 'lazydev' }
          else
            return vim.list_extend(vim.deepcopy(default_sources), extra_sources)
          end
        end,
        -- min_keyword_length = 3,
        providers = {
          path = {
            score_offset = 100,
            opts = {
              get_cwd = function(_)
                return vim.fn.getcwd()
              end,
              show_hidden_files_by_default = true,
            },
          },
          snippets = {
            score_offset = 0,
            opts = { friendly_snippets = false },
            should_show_items = function(ctx)
              return ctx.trigger.initial_kind ~= 'trigger_character'
            end,
          },
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            score_offset = 10,
            async = true,
            opts = { max_completions = 2 },
          },
          lsp = {
            transform_items = function(_, items)
              return vim.tbl_filter(function(item)
                return item.kind ~= require('blink.cmp.types').CompletionItemKind.Keyword
                  and item.kind ~= vim.lsp.protocol.CompletionItemKind.Snippet
              end, items)
            end,
          },
          tmux = {
            name = 'tmux',
            module = 'blink-cmp-tmux',
            score_offset = -1,
            opts = {
              all_panes = true,
              capture_history = true,
            },
          },
          env = {
            name = 'env',
            module = 'blink-cmp-env',
            score_offset = -5,
            opts = {
              item_kind = require('blink.cmp.types').CompletionItemKind.Variable,
              show_braces = false,
              show_documentation_window = true,
            },
          },
          emoji = {
            module = 'blink-emoji',
            name = 'emoji',
            score_offset = 15,
          },
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100, -- show at a higher priority than lsp
          },
        },
      },
    }
  end,
}
