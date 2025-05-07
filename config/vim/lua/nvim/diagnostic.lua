---@type vim.diagnostic.Opts
vim.diagnostic.config({
  underline = false,
  -- virtual_text = {
  --   spacing = 4,
  --   source = 'if_many',
  --   prefix = 'icons',
  -- },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '🔥',
      [vim.diagnostic.severity.WARN] = '💩',
      [vim.diagnostic.severity.HINT] = '👾',
      [vim.diagnostic.severity.INFO] = '🧠',
    },
  },
})

-- diagnostics = {
--   update_in_insert = false,
--   float = { border = 'rounded' },
--   severity_sort = true,
--   inlay_hints = { enabled = true },
--   codelens = { enabled = false },
--   capabilities = {
--     workspace = {
--       fileOperations = {
--         didRename = true,
--         willRename = true,
--       },
--     },
--   },
-- },
