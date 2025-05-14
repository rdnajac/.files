---@brief
---
--- [languageserver](https://github.com/REditorSupport/languageserver) is an
--- implementation of the Microsoft's Language Server Protocol for the R
--- language.
---
--- It is released on CRAN and can be easily installed by
---
--- ```r
--- install.packages("languageserver")
--- ```

return { --- @type vim.lsp.Config
  -- cmd = { 'R', '--quiet', '--no-echo', '--no-save', '-e', 'languageserver::run()' },
  cmd = { 'R', '--no-echo', '-e', 'languageserver::run()' },
  filetypes = { 'r', 'rmd', 'quarto' },
  root_markers = { 'DESCRIPTION' },
}
