local M = {
    "github/copilot.vim",
    event = "InsertEnter",
    -- dependencies = { "zbirenbaum/copilot-cmp", },
}

return M

-- function M.config()
--     require("copilot").setup {
--         panel = {
--             keymap = {
--                 jump_next = "<c-j>",
--                 jump_prev = "<c-k>",
--                 accept = "<c-l>",
--                 refresh = "r",
--                 open = "<M-CR>",
--             },
--         },
--         suggestion = {
--             enabled = true,
--             auto_trigger = true,
--             keymap = {
--                 accept = "<D-l>",
--                 next = "<D-j>",
--                 prev = "<D-k>",
--                 dismiss = "<D-h>",
--             },
--         },
--         filetypes = {
--             markdown = true,
--             help = false,
--             gitcommit = false,
--             gitrebase = false,
--         },
--         copilot_node_command = "node",
--     }
--
--     local opts = { noremap = true, silent = true }
--     vim.api.nvim_set_keymap("n", "<c-s>", ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
--
--     require("copilot_cmp").setup()
-- end
--
-- return M
