require('mason').setup({
  ensure_installed = {
    'bash-language-server',
    'lua-language-server',
    'marksman',
    'cmakelang',
    'cmakelint',
    'hadolint',
    'ruff',
    'markdownlint-cli2',
    'marksman',
    'prettier',
    'shellcheck',
    'shfmt',
    'stylua',
    'taplo',
  },
})
require('mason-lspconfig').setup()

-- Refer to :h vim.lsp.config() for more information.
-- vim.lsp.config("*", {
--   capabilities = vim.lsp.protocol.make_client_capabilities()
-- })

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(event)
--     local opts = { buffer = event.buf }
--
--     -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover({border = "rounded"})<cr>', opts)
--     vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
--     vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
--     vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
--     vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
--     vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
--     vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
--     vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
--     -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
--     -- vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
--     -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
--   end,
-- })
