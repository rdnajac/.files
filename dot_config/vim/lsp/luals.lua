--- @type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', 'stylua.toml' },
  -- single_file_support = true,
  -- log_level = vim.lsp.protocol.MessageType.Warning,
  settings = {
    Lua = {
      hover = {
        previewFields = 255,
      },
    },
  },
}
