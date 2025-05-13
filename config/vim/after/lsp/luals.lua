return { --- @type vim.lsp.Config
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
  root_markers = { 'stylua.toml' },

  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      diagnostics = {
        globals = { 'vim', 'Snacks' },
        disable = { 'missing-fields' },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library',
          vim.fn.expand('~/.config/vim/.plugged/snacks.nvim/'),
          vim.fn.expand('~/.config/vim/.plugged/which-key.nvim/'),
          vim.fn.expand('~/.config/vim/.plugged/nvim-treesitter/'),
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
