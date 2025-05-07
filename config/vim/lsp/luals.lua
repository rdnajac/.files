return {
  cmd = { vim.fn.stdpath('data') .. '/mason/bin/lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json' },

  settings = {
    Lua = {
      codeLens = { enable = true },
      completion = { callSnippet = 'Replace' },
      doc = { privateName = { '^_' } },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        paramName = 'Disable',
        semicolon = 'Disable',
        arrayIndex = 'Disable',
      },
      diagnostics = { disable = { 'missing-fields' } },
    },
  },
}
