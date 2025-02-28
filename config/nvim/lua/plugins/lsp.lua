return {
  'neovim/nvim-lspconfig',
  ---@class lspconfig.Config
  opts = function(_, opts)
    local Keys = require('lazyvim.plugins.lsp.keymaps').get()
      -- stylua: ignore
      vim.list_extend(Keys, {
        { 'K', function() return vim.lsp.buf.hover({ border = 'rounded' }) end, desc = 'Hover' },
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", has = "definition" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols({ filter = LazyVim.config.kind_filter }) end, desc = "LSP Symbols", has = "documentSymbol" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols({ filter = LazyVim.config.kind_filter }) end, desc = "LSP Workspace Symbols", has = "workspace/symbols" },
      })

    ---@type vim.diagnostic.Opts
    opts.diagnostics = {
      underline = false,
      float = { border = 'rounded' },
      virtual_text = { prefix = 'icons' },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '🔥',
          [vim.diagnostic.severity.WARN] = '💩',
          [vim.diagnostic.severity.HINT] = '👾',
          [vim.diagnostic.severity.INFO] = '🧠',
        },
      },
    }

    -- LSP Server Settings
    opts.servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              disable = { 'missing-fields' },
            },
          },
        },
      },

      bashls = {
        capabilities = require('blink.cmp').get_lsp_capabilities({
          textDocument = { completion = { completionItem = { snippetSupport = false } } },
        }),
      },
    }
  end,
}
