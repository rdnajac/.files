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
  end,

  ---@param opts blink.cmp.Config
  opts = function(_, opts)
    opts.completion.menu = { border = 'rounded' }
    opts.completion.documentation = { window = { border = 'rounded' } }
    opts.signature = { enabled = true, window = { border = 'rounded' } }
    opts.keymap = {
      preset = 'super-tab',
    }
    opts.sources = {
      providers = {
        lsp = {
          name = 'LSP',
          module = 'blink.cmp.sources.lsp',
          transform_items = function(_, items)
            return vim.tbl_filter(function(item)
              return item.kind ~= require('blink.cmp.types').CompletionItemKind.Keyword
            end, items)
          end,
        },
        path = { opts = { show_hidden_files_by_default = true } },
      },
    }
  end,
}
