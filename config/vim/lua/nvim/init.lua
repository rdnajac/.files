require('nvim.autocmds')
require('nvim.diagnostics')
require('nvim.keymaps')
require('nvim.treesitter')
require('munchies.terminal').setup()
require('utils')

vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup//'
vim.opt.mousescroll = 'hor:0'
vim.opt.pumblend = 0
vim.opt.signcolumn = 'yes'
vim.opt.winborder = 'rounded'

vim.opt.cmdheight = 0
-- vim.opt.messagesopt = 'wait:10,history:500'
require('vim._extui').enable({
  msg = {
    pos = 'box',
    box = {
      timeout = 4000,
    },
  },
})

-- HACK: stop msgshow
local ext = require('vim._extui.shared')
local messages = require('vim._extui.messages')

local original_msg_show = messages.msg_show

messages.msg_show = function(kind, content)
  if kind ~= 'search_cmd' and kind ~= 'list_cmd' then
    -- force `more = false` by replacing internal call
    local old_show_msg = messages.show_msg
    messages.show_msg = function(tar, content_, replace_last, _)
      old_show_msg(tar, content_, replace_last, false)
    end

    original_msg_show(kind, content)

    -- restore after call
    messages.show_msg = old_show_msg
  else
    original_msg_show(kind, content)
  end
end

-- Refer to :h vim.lsp.config() for more information.
vim.lsp.config('*', {
  -- capabilities = require('blink.cmp').get_lsp_capabilities(),
  capabilities = require('blink.cmp').get_lsp_capabilities(nil, true),

  ---@param client vim.lsp.Client
  ---@param bufnr integer
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)

    if client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, opts)
    end

    if client:supports_method('textDocument/codeLens') then
      vim.lsp.codelens.refresh()
      vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
      })

      print('LSP attached: ' .. client.name)
    end
  end,
})

vim.lsp.enable({
  'luals',
  'clangd',
  'bash-language-server',
  'marksman',
  -- 'r_language-server',
  'air',
  'ruff',
})
