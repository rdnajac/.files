-- https://cmp.saghen.dev/
---@module 'blink.cmp'
return {
  'Saghen/blink.cmp',
  dependencies = { { 'rafamadriz/friendly-snippets', enabled = false } },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'BlinkCmpMenuOpen',
      command = 'call copilot#Dismiss()',
      desc = 'Dismiss Copilot when BlinkCmp menu opens',
    })

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
    opts.signature = { enabled = true, window = { border = 'rounded' } }
    opts.keymap = {
      preset = 'super-tab',
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
    }
    opts.sources.providers.lsp = {
      transform_items = function(_, items)
        return vim.tbl_filter(function(item)
          return item.kind ~= require('blink.cmp.types').CompletionItemKind.Keyword
            and item.kind ~= vim.lsp.protocol.CompletionItemKind.Snippet
        end, items)
      end,
    }
    opts.sources.providers.path = { opts = { show_hidden_files_by_default = true } }
    opts.sources.providers.snippets = { opts = { friendly_snippets = false } }
  end,
}
