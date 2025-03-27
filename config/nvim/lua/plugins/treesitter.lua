return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.ensure_installed = {
        -- 'asm',
        'bash',
        'c',
        'cpp',
        'cuda',
        'comment', -- HACK: this is a custom parser
        'diff',
        'doxygen',
        -- 'groovy',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'latex',
        'llvm',
        'lua',
        'luadoc',
        'luap',
        'make',
        'markdown',
        'markdown_inline',
        'printf',
        'python',
        'query',
        'r',
        'rnoweb',
        'regex',
        'toml',
        'tmux',
        -- 'tsx',
        -- 'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      }

      require('nvim-treesitter.parsers').get_parser_configs().comment = {
        install_info = {
          url = '~/GitHub/rdnajac/tree-sitter-comment',
          files = { 'src/parser.c' },
          branch = 'main',
        },
      }
    end,
  },

  -- Wisely add 'end' in Ruby, Lua, Vimscript, etc.
  -- TODO: just use snippets or abbreviations instead
  { 'RRethy/nvim-treesitter-endwise', event = 'LazyFile' },
}
