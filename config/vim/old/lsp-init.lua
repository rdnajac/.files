-- keymaps 
LazyVim.lsp.on_dynamic_capability(require("lazyvim.plugins.lsp.keymaps").on_attach)

-- inlay hints
LazyVim.lsp.on_supports_method("textDocument/inlayHint", function(client, buffer)
  if
    vim.api.nvim_buf_is_valid(buffer)
    and vim.bo[buffer].buftype == ""
    and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
  then
    vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
  end
end)

-- code lens
LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
  vim.lsp.codelens.refresh()
  vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
    buffer = buffer,
    callback = vim.lsp.codelens.refresh,
  })
end)



local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        blink.get_lsp_capabilities() or {},
        opts.capabilities or {}
      )

  },

  -- cmdline tools and lsp servers
