---@module 'blink.cmp'
return {
  'Saghen/blink.cmp',
  dependencies = { { 'rafamadriz/friendly-snippets', enabled = false } },
  ---@param opts blink.cmp.Config
  opts = function(_, opts)
    opts.completion.menu = { border = 'rounded' }
    opts.completion.documentation = { window = { border = 'rounded' } }
    opts.signature = { enabled = true, window = { border = 'rounded' } }
    opts.keymap = {
      preset = 'super-tab',
    }
    -- opts.sources = {
    --   providers = {
    --     path = {
    --       name = 'Path',
    --       module = 'blink.cmp.sources.path',
    --       show_hidden_files_by_default = true,
    --     },
    --   },
    -- }

    -- opts.sources.providers.path.show_hidden_files_by_default = true
  end,
}
-- ~/.
--     sources = {
--       transform_items = function(_, items)
--         return vim.tbl_filter(function(item)
--           return item.kind ~= require('blink.cmp.types').CompletionItemKind.Snippet
--         end, items)
--       end,

--       providers = {
--         path = {
--           score_offset = 333,
--           fallbacks = { 'buffer' },
--           opts = {
--           },
--         },
--       },
--     },
--   }
--   return config
-- }
