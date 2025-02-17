; https://github.com/chrisgrieser/.config/blob/f4fcdacea41550cb8eb6026a3190577d00d40d3f/nvim/queries/comment/highlights.scm#L2
;extends
; INFO this requires Treesitter `comments` parser: `TSInstall comments`
; https://github.com/nvim-treesitter/nvim-treesitter#adding-queries
;───────────────────────────────────────────────────────────────────────────────

; add more comments tags -> https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/comment/highlights.scm

; `inline_code` in comments is highlgihted
; not working `with spaces` or special characters inside `:h`,
; see https://github.com/stsewd/tree-sitter-comment/issues/34
("text" @markup.raw.markdown_inline
 (#match? @markup.raw.markdown_inline "`.+`")
 ; this doesn't work either:
 ; (#match? @markup.raw.markdown_inline "`[^`]+`")
  (#set! "priority" 150)
 )

; MAKE UPPERCASE COMMENTS BOLD
; (requires setting the hlgroup `@comments.bold`)
("text" @comment.bold
 (#lua-match? @comment.bold "^[%u%d%p][%u%d%p]+$"))
