return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- FIXME: The next commit breaks render-markdown
    commit = 'f0ff9f0',
    config = function(_, opts)
      -- configure installation of custom parser
      require('nvim-treesitter.parsers').get_parser_configs().comment = {
        install_info = {
          -- BUG: not working... might need to require("nvim-treesitter.install").prefer_git = true
          -- or maybe the issue is the name collision
          -- install locally instead:
          -- url = 'https://github.com/rdnajac/tree-sitter-comment',
          url = '~/GitHub/rdnajac/tree-sitter-comment',
          files = { 'src/parser.c' },
          branch = 'main',
          requires_generate_from_grammar = true,
        },
      }
      opts.ensure_installed = {
        'bash',
        'c',
        'comment',
        'diff',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'latex',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'printf',
        'python',
        'query',
        'r',
        'rnoweb',
        'regex',
        'toml',
        -- 'tsx',
        -- 'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      }
    end,
  },

  -- Wisely add 'end' in Ruby, Lua, Vimscript, etc.
  { 'RRethy/nvim-treesitter-endwise', event = 'LazyFile' },
}
