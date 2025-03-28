-- https://cmp.saghen.dev/
---@module 'blink.cmp'
return {
  'Saghen/blink.cmp',
  ---@type blink.cmp.Config
  opts = {
    completion = {
      menu = {
        draw = {
          columns = {
            { 'label', 'label_description', gap = 1 },
            { 'kind_icon', 'kind', gap = 1, 'source_name' },
          },
        },
        auto_show = false,
        border = 'rounded',
      },
    },
    signature = { enabled = false },
    sources = {
      compat = {},
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
        -- TODO: turn off LSP snippets
      },
    },
  },
}
