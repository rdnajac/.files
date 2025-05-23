; INFO: this requires Treesitter `inlinecode` parser: `TSInstall comments`
; https://github.com/nvim-treesitter/nvim-treesitter#adding-queries
; also see https://github.com/stsewd/tree-sitter-comment/issues/34
; ──────────────────────────────────────────────────────────────────────────────

; highlight `source_code` nodes within comments as strings
; for more information, see `:h treesitter-query` and `h: treesitter-language-injections`
((source_code) @string
 (#set! "priority" 151))

; TODO: make this work for comments that span multiple lines
; TODO: make this work with folke's `todo-comments`
