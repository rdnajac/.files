local M = {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},

        {'L3MON4D3/LuaSnip'},
    },
}

function M.config()
    local lsp_zero = require('lsp-zero')

    require("mason").setup {
        ui = { border = "rounded" },
    }

    local servers = {
        "lua_ls",
        "clangd",
        "bashls",
        "yamlls",
        "marksman",
    }

    local lsp_attach = function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end

    lsp_zero.extend_lspconfig({
        sign_text = true,
        on_attach = lsp_attach,
        float_border = 'rounded',
        capabilities = require('cmp_nvim_lsp').default_capabilities()
    })

    require("mason-lspconfig").setup {
        ensure_installed = servers,
        handlers = {
            lsp_zero.default_setup,
            lua_ls = function()
                require('lspconfig').lua_ls.setup({
                    on_init = function(client)
                        lsp_zero.nvim_lua_settings(client, {})
                    end,
                })
            end,
        },
    }
end

return M
