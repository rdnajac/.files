-- https://cmp.saghen.dev/
---@module 'blink.cmp'
return {
  'Saghen/blink.cmp',
  dependencies = {
    { 'bydlw98/blink-cmp-env' },
    { 'mgalliou/blink-cmp-tmux' },
    { 'fang2hou/blink-copilot' },
    { 'rafamadriz/friendly-snippets', enabled = false },
  },

  init = function()
    -- vim.api.nvim_create_autocmd('User', {
    --   pattern = 'BlinkCmpMenuOpen',
    --   command = 'call copilot#Dismiss()',
    --   desc = 'Dismiss Copilot when BlinkCmp menu opens',
    -- })
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
  end,

  --- @param opts blink.cmp.Config
  opts = function(_, opts)
    -- opts.completion.trigger.show_in_snippet = false
    opts.completion.documentation = { window = { border = 'rounded' } }
    opts.completion.menu = { border = 'rounded', auto_show = true }
    opts.completion.menu.draw =
      { columns = { { 'kind_icon' }, { 'label', 'label_description', 'source_name', gap = 1 } } }
    -- TODO: fixme signature = {  window = { border = 'single' } },
    opts.signature = { enabled = true, window = { border = 'rounded' } }
    opts.keymap = {
      -- preset = 'super-tab',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            -- return cmp.accept()
            return false
          else
            return cmp.select_and_accept()
          end
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
    }

    local defaults = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'copilot', 'tmux' }

    opts.sources.default = function()
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      row = row - 1 -- 0-indexed
      local check_col = col > 0 and col - 1 or col

      local ok, node = pcall(vim.treesitter.get_node, { pos = { row, check_col } })
      if
        ok
        and node
        and vim.tbl_contains({ 'comment', 'comment_content', 'line_comment', 'block_comment' }, node:type())
      then
        return { 'lsp', 'path', 'buffer', 'copilot', 'tmux' }
      else
        return defaults
      end
    end

    opts.sources.providers.path = {
      score_offset = 101,
      opts = {
        get_cwd = function(_)
          return vim.fn.getcwd()
        end,
        show_hidden_files_by_default = true,
      },
    }

    opts.sources.providers.snippets = {
      score_offset = 100,
      opts = { friendly_snippets = false },
    }

    opts.sources.providers.copilot = {
      name = 'copilot',
      module = 'blink-copilot',
      score_offset = 99,
      async = true,
      opts = { max_completions = 1 },
    }

    opts.sources.providers.lsp = {
      transform_items = function(_, items)
        return vim.tbl_filter(function(item)
          return item.kind ~= require('blink.cmp.types').CompletionItemKind.Keyword
            and item.kind ~= vim.lsp.protocol.CompletionItemKind.Snippet
        end, items)
      end,
    }

    opts.sources.providers.tmux = {
      name = 'tmux',
      module = 'blink-cmp-tmux',
      opts = {
        all_panes = true,
        capture_history = true,
      },
    }
  end,
}
