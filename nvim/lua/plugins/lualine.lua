local M = {
    "nvim-lualine/lualine.nvim",
}

function M.config()
    local sl_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
    vim.api.nvim_set_hl(0, "Copilot", { fg = "#6CC644", bg = sl_hl.background })
    local icons = require "icons"
    local diff = {
        "diff",
        colored = true,
        symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
    }

    local copilot = function()
        local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
        if #buf_clients == 0 then
            return "LSP Inactive"
        end

        local buf_client_names = {}
        local copilot_active = false

        for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" and client.name ~= "copilot" then
                table.insert(buf_client_names, client.name)
            end

            if client.name == "copilot" then
                copilot_active = true
            end
        end

        if copilot_active then
            return "%#Copilot#" .. icons.git.Octoface .. "%*"
        end
        return ""
    end

    local displsp = function()
        local msg = 'N/A'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end

    require("lualine").setup {
        options = {
            component_separators = { left = "", right = "" },
            --component_separators = { left = '', right = '' },
            --section_separators = { left = "", right = "" },
            section_separators = { left = '', right = '' },
            --section_separators = { left = "", right = "" },

            ignore_focus = { "NvimTree" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { {"branch", icon =icons.git.Branch} , diff },
            lualine_c = { "diagnostics", copilot },
            lualine_x = { "filetype", "fileformat", "o:encoding" ,  },
            lualine_z = { "location", "progress" },
            lualine_y = { {displsp, icon = " LSP:"}, },
        },
        extensions = { "quickfix", "man", "fugitive" },
    }
end

return M
