vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.shellharden = 1

require('nvim.ui')
require('munchies')
require('nvim.autocmds')
require('nvim.keymaps')

vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup//'
-- vim.opt.cmdheight = 0
vim.opt.mousescroll = 'hor:0'
vim.opt.pumblend = 0
-- default `ltToOCF`, current `oCcTaFltIWO`, Vim default `filnxtToOS`
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true, a = true })
vim.opt.winborder = 'rounded'

vim.diagnostic.config({ ---@type vim.diagnostic.Opts
  underline = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '🔥',
      [vim.diagnostic.severity.WARN] = '💩',
      [vim.diagnostic.severity.HINT] = '👾',
      [vim.diagnostic.severity.INFO] = '🧠',
    },
  },
})

-- Refer to :h vim.lsp.config() for more information.
vim.lsp.config('*', {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  on_attach = function(client)
    local opts = { buffer = client.buf }
    print(client.name .. ' started in the background')
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    -- vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  end,
})

vim.lsp.enable({
  'luals',
  'clangd',
  'bash-language-server',
  'r_language-server',
  'ruff'
})

-- Snacks.util.on_module('blink.cmp', function()
--   local blink = require('blink.cmp')
--   if blink.get_lsp_capabilities then
--     vim.lsp._default_config.capabilities = vim.tbl_deep_extend(
--       'force',
--       vim.lsp._default_config.capabilities or vim.lsp.protocol.make_client_capabilities(),
--       blink.get_lsp_capabilities()
--     )
--   end
-- end)
