;extends
; INFO this requires Treesitter `comments` parser: `TSInstall comments`
; https://github.com/nvim-treesitter/nvim-treesitter#adding-queries
;───────────────────────────────────────────────────────────────────────────────

; `inline_code` in comments is highlgihted
; not working `with spaces` or special characters inside `:h`,
; see https://github.com/stsewd/tree-sitter-comment/issues/34
("inline_code" @markup.raw.markdown_inline
  (#match? @markup.raw.markdown_inline "`[^`]+`")
  (#set! "priority" 150)
)
