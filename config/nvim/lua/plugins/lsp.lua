return {
  'neovim/nvim-lspconfig',
  ---@class lspconfig.Config
  opts = function(_, opts)
    -- https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
    local keys = require('lazyvim.plugins.lsp.keymaps').get()
    -- stylua: ignore
    keys[#keys + 1] = { 'K', function() return vim.lsp.buf.hover({ border = 'rounded' }) end, desc = 'Hover', }

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
