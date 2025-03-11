return {
  'neovim/nvim-lspconfig',
  ---@class lspconfig.Config
  opts = function(_, opts)
    -- https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
    local keys = require('lazyvim.plugins.lsp.keymaps').get()
    -- stylua: ignore start
    keys[#keys + 1] = { 'K', function() return vim.lsp.buf.hover({ border = 'rounded' }) end, desc = 'Hover', }
    keys[#keys + 1] = { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' }
    keys[#keys + 1] = { 'gD', function() Snacks.picker.lsp_declarations() end, desc = 'Goto Declaration' }
    keys[#keys + 1] = { 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References' }
    keys[#keys + 1] = { 'gI', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementation' }
    keys[#keys + 1] = { 'gy', function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto T[y]pe Definition' }
    keys[#keys + 1] = { '<leader>ss', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols' }
    keys[#keys + 1] = { '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' }
    -- stylua: ignore end

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
      r_language_server = {
              root_dir = function(fname)
                return require("lspconfig.util").root_pattern("DESCRIPTION", "NAMESPACE", ".Rbuildignore")(fname)
                  or require("lspconfig.util").find_git_ancestor(fname)
                  or vim.loop.os_homedir()
              end,
            },
    }
  end,
}
